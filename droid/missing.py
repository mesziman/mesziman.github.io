import os, fnmatch
import subprocess
import argparse
import sys
# Instantiate the parser
parser = argparse.ArgumentParser(description='Optional app description')
parser.add_argument('vendorpath',
                    help='A required integer positional argument')
parser.add_argument('targetpath',
                    help='A required integer positional argument')
so_vendor = []
so_system = []
so_system_ext = []
so_product = []
so_apex = []
deplist = {}
EXCLUDE_REGEX="*.policy|*.acdb|*.apk|*.b00|*.b01|*.b02|*.b03|*.b04|*.bin|*.cfg|*.cng|*.conf|*.config|*.dat|*.db|*.elf|*.fw|*.jar|*.json|*.mdt|*.mk|*.pem|*.qwsp|*.rc|*.sql|*.tflite|*.txt|*.widevine|*.wmfw|*.xml"


def valid(name):
	global EXCLUDE_REGEX
	extensions = EXCLUDE_REGEX.split("|")
	for ex in extensions:
		if fnmatch.fnmatch(name, ex):
			return False
	return True

def find(path):
    result = []
    for root, dirs, files in os.walk(path):
        for name in files:
            if valid(name):
                result.append(os.path.join(root, name))
    return result

def find_name(pattern, path):
    result = []
    for root, dirs, files in os.walk(path):
        for name in files:
            if fnmatch.fnmatch(name, pattern):
                result.append(name)
    return result

def read_dependencies(currentfile):
    #res = subprocess.check_output(['readelf', '-d {}  2> /dev/null | grep "\\(NEEDED\\)" | sed -r "s/.*\\[(.*)\\]/\\1/"'.format(currentfile)])
    output = os.popen('readelf -d {}  2> /dev/null | grep "\\(NEEDED\\)" | sed -r "s/.*\\[(.*)\\]/\\1/"'.format(currentfile)).read()
    return output


def parse_vendor(path):
    global so_system_ext
    global so_system
    global so_product
    global so_vendor
    global so_apex
    global deplist
    vendorfiles = find(os.path.dirname(os.path.abspath(__file__)) + "/" + path)
    #print (read_dependencies(vendorfiles[1]))
    for vfile in vendorfiles:
        dependency = read_dependencies(vfile).split("\n")
        dependency.remove("")
        for dep in dependency:
        	if dep == "libgcc.so":
        		continue
	        if dep not in so_apex and dep not in so_vendor and dep not in so_system and dep not in so_system_ext and dep not in so_product:
	            if dep not in deplist:
	            	deplist[dep] = []
	            deplist[dep].append(vfile)


def parse_target(path):
    global so_system_ext
    global so_system
    global so_product
    global so_vendor
    global so_apex
    so_apex = find_name('*.so',  os.path.dirname(os.path.abspath(__file__)) + "/" + path + "/apex")
    so_product = find_name('*.so',  os.path.dirname(os.path.abspath(__file__)) + "/" + path + "/product")	
    so_system = find_name('*.so',  os.path.dirname(os.path.abspath(__file__)) + "/" + path + "/system")
    so_system_ext = find_name('*.so',  os.path.dirname(os.path.abspath(__file__)) + "/" + path + "/system_ext")
    so_vendor = find_name('*.so',  os.path.dirname(os.path.abspath(__file__)) + "/" + path + "/vendor")

def main():
    args = parser.parse_args()
    global deplist
    parse_target(args.targetpath)
    parse_vendor(args.vendorpath)
    for k,v in deplist.iteritems():
        print k, "needed by",v

if __name__ == "__main__":
    # execute only if run as a script
    main()
