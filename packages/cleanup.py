def cleanup():
    with open("cleanup.txt", "r") as file:
        content = file.readlines()
        for line in content:
            print(line)


cleanup()
