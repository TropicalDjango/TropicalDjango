def fileRead(file_in_name, file_out):
    
    file_in = open(file_in_name,'r')
    Lines = file_in.readlines()
    
    comments = ""
    start_com = False
    comment_count = 0
    
    for line in Lines:
        index = line.find("/**")
        if index != -1 and not start_com:
            comments = line[index+3:]
            file_out.write(comments)
            start_com = True
        else:
            if start_com:
                index = line.find("*/\n")
                if index != -1:
                    comments = line[:index]
                    file_out.write(comments)
                    start_com = False
                else:   
                    comments = line[2:]
                    file_out.write(comments)
            else:
                continue

def parseDir(file_out):
    print(file_out)
    fileRead('test.cpp',file_out)

if __name__ == "__main__":
    print("Here")
    file_out = open("README.md", 'w')
    parseDir(file_out)
