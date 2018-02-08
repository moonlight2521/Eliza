#!/user/local/bin/perl -w
##########################################################################################################3#
#Zun Lin
#CMSC 416
#Programming Assignment 1
#Eliza
#Purpose: This program is my version of Eliza a chat bot that is created by Joseph Weizenbaum to simulated 
#conversation using pattern matching.
#
#To run the progam in the terminal type perl eliza.pl
#Algorithm: just a branch of if and else if statement, I didnt used any algorithm. 
#Problem: the problem I run to during this assigment is that perl is pretty new to me so it took 
#me some time to get familiar with the language.
#Example:
#	[eliza] Hello I'm Eliza your psychotherapit. What is your name? 
#	[user] Zun 
#	[eliza] Hello Zun , How can I help you today? 
#	[user] I want to rule the world
#	[eliza] Why do you want to rule the world? 
#	[user] I dont know, I think I crave power
#	[eliza] Why don't you tell me more about your cravings. 
#	[user] quit
##########################################################################################################3#
#pirnt out the greeting statment
print "Hello I'm Eliza your psychotherapit. What is your name? \n";
#get user input as variable for name and chomp the name to not going to the next line. 
$name = <STDIN>; chomp $name;
#using regex to get the user name. 
$name =~ s/([M|m]y name is|[I|i]'m|[I|i] am|[I|i]m) ?(.+)/$2/;
#Change the first letter to upper case.
$name = ucfirst($name);
#print out the name to the terminal and ask user how Eliza can hlep them.
print"Hello $name, How can I help you today? \n";
#while loop to keep the program running if there is a input from user and quit if user type in "quit".
while(1){
	#get user input statement, chomp the input and change all letters to lowecase. 
	$statement = <STDIN>; chomp $statement; 
	$statement = lc($statement);
	#####################################################################################################3#
	#The following code is using if statement to match the user inpunt and print out a respond.           #
	#####################################################################################################3#
	#if user enter the statement that matches the phase there is a respond for that phase.
	if($statement =~ m/(i am|i\'?m|im) feeling (.+)/){
		$statement = "Why are you feeling $2?";
	}elsif($statement =~ m/i gave (.+) to (.+)/){
		$statement = "Why would you give $1 $2?";
	}elsif($statement =~ m/because (.+)/){	
		$statement = "Is that the only reason?";
	}elsif($statement =~ m/i want to (.+)/){
		$statement = "Why do you want to $1?";
	}elsif($statement =~ m/i need to (.+)/){
		$statement = "Tell me more about your needs.";
	}elsif($statement =~ m/why don\'?t you (.+)/){
		$statement = "Are you should you want me to do $1.?";
	}elsif($statement =~ m/why can\'?t i (.+)/){
		$statement = "Believe you can $1, and you will success in it.";
	}elsif($statement =~ m/(i am|i\'?m|im) (.+)/){
		$statement = "How did you become $2";
	}elsif($statement =~ m/i (cant|can\'?t|can not) (.+)/){	
		$statement = "How do you know you can't $2?";
	}elsif($statement =~ m/she|he is (.+)/){	
		$statement = "Are you sure about that?";	
	}elsif($statement =~ m/(are you|you are) (.+)/){
		$statement = "Does it matter if I am $2?";
	}elsif($statement =~ m/i feel (.+)/){	
		$statement = "Why do you feel $1?";
	}elsif($statement =~ m/i (forgot|forgot to) (.+)/){	
		$statement = "Why did you forgot $2?";
	}elsif($statement =~ m/yes|yeah|si|yea/){	
		$statement = "You might be right, tell me more about it.";
	}elsif($statement =~ m/no|nah|maybe|probably not/){	
		$statement = "Ok, I have no comment about it. Let's change a subject.";	
	}elsif($statement =~ m/ok|sure/){	
		$statement = "Good to hear that. What else would you like to talk about?";	
	}elsif($statement =~ m/i would (.+)/){	
		$statement = "Why would you $1?";
	}elsif($statement =~ m/i have (.+)/){	
		$statement = "Are you sure you have $1?";
	}elsif($statement =~ m/my (.+)/){	
		$statement = "Is that right? your $1";
	}elsif($statement =~ m/why (.+)/){	
		$statement = "Why don't you try to figure it out?";
	}elsif($statement =~ m/is there (.+)/){	
		$statement = "Do you think there is $1";
	}elsif($statement =~ m/(it is|its|it's) (.+)/){	
		$statement = "Why do you think it is $2?";
	}elsif($statement =~ m/i hate you(.+)/){	
		$statement = "Why do you hate me?";
	}elsif($statement =~ m/i love you(.+)/){	
		$statement = "I love you too.";		
	}elsif($statement =~ m/i hate (.+)/){	
		$statement = "Why do you hate $1?";
	}elsif($statement =~ m/i love (.+)/){	
		$statement = "why do you love $1?";	
	#if the user enter they think they... this line of code whill run and think them to say more about it	
	}elsif($statement =~ m/(.+)?i think i (\S*)/){
	#word spotting for anything that end with e and change to ings
		$word = $2;			 #set word to the second group of the input
		$word =~ s/e$/ings/;  #change e to ing
		$statement = "Why don't you tell me more about your $word."; #set the statement 
			#quit the while loop and end the program if the user enter "quit" as statement
	}elsif($statement =~ m/i think (.+)/){	
		$statement = "Are you sure about that?";			
	}elsif($statement =~ m/i (.+)/){	
		$statement = "Are you sure you $1?";
	}elsif($statement =~ m/how (.+)/){	
		$statement = "Perhaps you can ask youself that question.";
	}elsif($statement =~ m/what (.+)/){	
		$statement = "I not too sure, why do you ask?";
	}elsif($statement =~ m/when (.+)/){	
		$statement = "Why don't you tell me more about it?";
	}elsif($statement eq 'goodbye'){
		print"Quiting Eliza! Goodbye.\n";
		last;	
	}elsif($statement eq 'bye'){
		print"Quiting Eliza! Goodbye.\n";
		last;		
	}elsif($statement eq 'quit'){
		print"Quiting Eliza! Goodbye.\n";
		last;	
	} elsif($statement =~ m/(\S*)/){
	#if the user enter gabberish, Eliza will as the user to enter the input again.	
		$statement = "Sorry I don't get what you are saying. try again.";
	}
	#print the statement to the user
	print("$statement \n");
		#quit the while loop and end the program if the user enter "quit" as statement
		if($statement eq 'quit'){
			last;
		}
}