import sys

def main():
	readmePath = sys.argv[1]
	versionNumber = sys.argv[3]
	buildNumber = sys.argv[2]
	with open(readmePath, 'r') as file:
		data = file.readlines()

	data[0] = "Salt {0}.{1} \n".format(versionNumber, buildNumber)

	with open(readmePath, 'w') as file:
		file.writelines(data)

main()