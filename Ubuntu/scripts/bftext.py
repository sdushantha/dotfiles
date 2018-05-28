import random, time
text = input("Text: ")
target, string_array = text, [""]
while len(string_array) <= len(target):
    string_array[-1:] = ([string_array[-1]] if string_array[-1]==target[len(string_array)-1] else []) + [chr(random.randint(32,126))]
    print("\r"+"".join(string_array[:len(target)]),end='')
    time.sleep(0.006)
print("")
