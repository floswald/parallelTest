



# to be run on all nodes

function sayhello()
   println("hi I am worker number $(myid())")
end

function domath(i::Integer)
	if i < 2
		error("need i>2")
	end
	println("Hi, I am worker number $(myid()) doing some math")
	x = rand(i,i)
	mean(x)
end



function doBIGmath()
	println("allocating a 30000 by 10000 matrix ")
	x = rand(30000,10000);
	r = round(sizeof(x) /  1.074e+9 , 2)
	println("my matrix has $r GB")
	mean(x)
end