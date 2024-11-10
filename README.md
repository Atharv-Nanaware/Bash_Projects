# Bash_Projects


# Shell Scripting
Shell scripting is a scripting language that runs on top of a shell environment which is used to perform automation for repetitive tasks, manage system configurations, and execute a series of commands by writing it in a script and running it. Some of the requirements where shell script will help us is system administration, software installations, file manipulations, etc.

The basic syntax of Shell Script is below and the filename ends with .sh file extension.

#!/bin/bash

# variable declaration / series of commands / functions / functions calls etc
Shebang
The first line of a shell script is always a shebang usually the bash #!/bin/bash which specifies the interpreter to execute the script. When the script is executed the kernel reads the shebang line and uses that interpreter to execute that script.

cat $SHELL - displays the current shell type you are working on.
cat /etc/shells - displays the available shells of that machine.
echo "The first line in this script above is the 'shebang'"
Note: Basically, #!/bin/bash is the superset of #!/bin/sh (shell) so in your scripts always incorporate the use of the bash shebang as it is universally used and I have used the same to explain the syntaxes.

Steps to run a Shell Script
To run a shell script we need to follow the below two steps:

make the script executable by giving execute permission chmod u+x <scriptFile>
./<fileName> to run the shell script from the terminal.
Now let’s learn the concepts available in Shell Scripting. Boom!!

Reading Input from User
The read command helps in reading the user input (i.e. line of text) from the standard input stdin.

#!/bin/bash

# reads input from the user and puts it in the username variable
echo "Enter Username: "
read username
echo $username

# displays the prompt message
# -p stand for prompt
# reads input from the user and puts it in the newusername variable
read -p "Enter the new username: " newusername
echo $newusername

# reads input from the user & hides the text from echoing in the terminal
# -s stands for silent
read -sp "Enter Password: " password
echo ""
echo $password
if you don’t wish to specify the variable name for the read we can use $REPLY to echo the value

#!/bin/bash

echo "Enter the username: "
read
echo "Read without variable name assignment: "$REPLY
Command Substitution
Command substitution enables the output of the command to be substituted as a value to the variable. It can be done in two ways:

Using backticks (`)
Using the dollar sign ($)
#!/bin/bash

echo "Method 1 - using backticks"
working_dir=`pwd`
echo $working_dir

echo "Method 2 - using $ sign"
working_dir=$(pwd)
echo $working_dir
Argument Passing
We can pass arguments that can be used inside the scripts when it is executed. Those arguments can be accessed by the script using special variables like $1 $2 $3 etc.

$0 - returns the file name of the shell script.
$@ - returns all arguments passed from cli.
$# - returns the no of arguments passed from cli.
Let’s say we have a script file named argument_passing.sh and let's pass 2 arguments to it.

argument_passing.sh "Vish" "DevOps Engineer"
#!/bin/bash

# gives the filename of the script itself
echo "FileName Argument: "$0 # argument_passing.sh

# gives the first argument passed
echo "First Argument: "$1 # Vish

# gives the second argument passed
echo "Second Argument: "$2 # DevOps Engineer

# displays all arguments passed
echo "All Arguments: "$@ # Vish DevOps Engineer

# displays number of arguments passed
echo "No of Arguments: "$# # 2
Arithmetic Operations
In shell scripting, to perform arithmetic operations we need to use double parenthesis (( )) which is used for arithmetic expansion on integers. The double parenthesis (( )) is also called a unary operator.

#!/bin/bash

n1=10
n2=5

echo "Sum of two numbers: "$(($n1+$n2)) # Addition
echo "Sub of two numbers: "$(($n1-$n2)) # Substraction
echo "Mul of two numbers: "$(($n1*$n2)) # Mulitplication
echo "Div of two numbers: "$(($n1/$n2)) # Division
echo "Modulus of two numbers: "$(($n1%$n2)) # Modulus
We can also use test command to work with arithmetic and string operations which provide more flexibility along with unary operators.

Conditionals
In shell scripting, [[ ]] or test command can be used for evaluating conditional expressions. Below are certain unary operators that can be used for testing the conditions

Conditions
[[ -z STRING ]] - Empty string
[[ -n STRING ]] - Not empty string
[[ STRING == STRING ]] - Equal
[[ STRING != STRING ]] - Not equal
[[ NUM -eq NUM ]] - Equal
[[ NUM -ne NUM ]] - Not equal
[[ NUM -lt NUM ]] - Less than
[[ NUM -le NUM ]] - Less than or equal
[[ NUM -gt NUM ]] - Greater than
[[ NUM -ge NUM ]] - Greater than or equal
[[ ! EXPR ]] - Not
[[ X && Y ]] - And
[[ X || Y ]] - Or
File Conditions
[[ -e FILE ]] - Exists
[[ -r FILE ]] - Readable
[[ -h FILE ]] - Symbolic link
[[ -d FILE ]] - Directory
[[ -w FILE ]] - Writable file
[[ -s FILE ]] - File size is > 0 bytes
[[ -f FILE ]] - File
[[ -x FILE ]] - Executable file
#!/bin/bash

a=10
b=20

# less than using square brackets
if [[ $a -lt $b ]]
then
   echo "a is less than b"
else
   echo "a is not less than b"
fi

# less than using test command
if test "$a" -lt "$b"
then
   echo "a is less than b"
else
   echo "a is not less than b"
fi
Loops
if else
if else loop is a conditional statement that allows executing different commands based on the condition true/false. Here square brackets [[ ]] are used to evaluate a condition.

Let’s create a file named ifelse.sh and input the below code

#!/bin/bash

# -e stands for exists
if [[ -e ./ifelse.sh ]]
then
  echo "File exists"
else
  echo "File does not exist"
fi
elif
elif is a combination of both else and if. It is used to create multiple conditional statements and it must be always used in conjunction with if else statement

#!/bin/bash

read -p "Enter the number between 1 to 3: " number

if [[ $number -eq 1 ]]
then
        echo "The number entered is 1"
elif [[ $number -eq 2 ]]
then
        echo "The number entered is 2"
elif [[ $number -eq 3 ]]
then
        echo "The number entered is 3"
else
        echo "Invalid Number"
fi
for
The for loop is used to iterate over a sequence of values and below is the syntax

#!/bin/bash

for i in {1..10}
do
  echo "Val: $i"
done

# C style/Old Style of for loop
for((i=0;i<=10;i++))
do
  echo "Val: $i"
done
while
The while loop is used to execute a set of commands repeatedly as long as a certain condition is true. The loop continues until the condition is false.

#!/bin/bash

count=0

while [ $count -lt 5 ]
do
  echo $count
  count=$(($count+1))
done
until
The until loop in shell scripting is used to execute a block of code repeatedly until a certain condition is met.

#!/bin/bash

count=1

until [ $count -gt 5 ]
do
    echo $count
    count=$(($count+1))
done
Arrays
An array is a variable that can hold multiple values under a single name

${arrayVarName[@]} - displays all the values of the array.
${#arrayVarName[@]} - displays the lenght of the array.
${arrayVarName[0]} - displays the first element of the array
${arrayVarName[-1]} - displays the last element of the array
unset arrayVarName[2] - deletes the 2 element
#!/bin/bash

# Declare an array of fruits
fruits=("apple" "banana" "orange" "guava")

# Print the entire array
echo "All fruits using @ symbol: ${fruits[@]}"
echo "All fruits using * symbol: ${fruits[*]}"

# Print the third element of the array
echo "Third fruit: ${fruits[2]}"

# Print the length of the array
echo "Number of fruits: ${#fruits[@]}"
Break Statement
break is a keyword. It is a control statement that is used to exit out of a loop ( for, while, or until) when a certain condition is met. It means that the control of the program is transferred outside the loop and resumes with the next set of lines in the script

#!/bin/bash

count=1

while true
do
  echo "Count is $count"
  count=$(($count+1))
  if [ $count -gt 5 ]; then
    echo "Break statement reached"
    break
  fi
done
Continue statement
continue is a keyword that is used inside loops (such as for, while, and until) to skip the current iteration of the loop and move on to the next iteration. It means that when the continue keyword is encountered while executing a loop the next set of lines in that loop will not be executed and moves to the next iteration.

#!/bin/bash

for i in {1..10}
do
  if [ $i -eq 5 ]
  then
    continue
  fi
  echo $i
done
Functions
Functions are a block of code which can be used again and again for doing a specific task thus providing code reusability.

Normal Function
#!/bin/bash

sum(){
        echo "The numbers are: $n1 $n2"
        sum_val=$(($n1+$n2))
        echo "Sum: $sum_val"
}

n1=$1
n2=$2
sum
Function with return values
To access the return value of the function we need to use $? to access that value

#!/bin/bash

sum(){
        echo "The numbers are: $n1 $n2"
        sum_val=$(($n1+$n2))
        echo "Sum: $sum_val"
        return $sum_val
}

n1=$1
n2=$2
sum

echo "Retuned value from function is $?"
Variables
The variable is a placeholder for saving a value which can be later accessed using that name. There are two types of variable

Global - Variable defined outside a function which can be accessed throughout the script
Local - Variable defined inside a function and can be accessed only within it
#!/bin/bash

# x & y are global variables
x=10
y=20

sum(){
        sum=$(($x+$y))
        echo "Global Variable Addition: $sum"
}

sum

sub(){
        # a & b are local variables
        local a=20
        local b=10
        local sub=$(($a-$b))
        echo "Local Variable Substraction: $sub"
}

sub
Dictionaries
In shell scripting, dictionaries are implemented using associative arrays. An associative array is an array that uses a string as an index instead of an integer

#!/bin/bash

# declare a associative array
declare -A colours

# add key value pairs
colours['apple']=red
colours['banana']=yellow
colours['orange']=orange
colours['guava']=green
colours['cherry']=red

echo "Size of dict: ${#colours[@]}"
echo "Color of apple: ${colours['apple']}"
echo "All dict keys: ${!colours[@]}"
echo "All dict values: ${colours[@]}"

# Delete cherry key
unset colours['cherry']
echo "New dict: ${colours[@]}"

# iterate over keys
for key in ${!colours[@]}
do
        echo $key
done

# iterate over values
for value in ${colours[@]}
do
        echo $value
done
Set Options — The Saviour
The set command allows us to change or display the values of shell options. We can use it to set options to turn certain shell options on & off.

set -x - it's like a debug mode. whatever commands are being performed will be printed first then the output of the command will be displayed

set -e - immediately exits the script when a non zero exit code is occurred. But when we have commands with pipe say sdfdsf | echo 'vish'. Here since the last command executed in the line is echo which returns zero exit code so the entire line of command is considered success but the previous command sdsds will return non zero which is wrong. To catch this we can use the below set option

set -o pipefail - To overcome the above pipe command error we can use set -o pipefail option which will catch and stop the script immediately. So here each command should return a zero exit code. If not the script will fail.


