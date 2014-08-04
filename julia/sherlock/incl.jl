



# to be run on all nodes

function sayhello()
   println("hi I am worker number $(myid())")
end

function domath(i::Integer)
	if i < 2
		error("need i>2")
	end
	println("worker number $(myid()) doing some math")
	x = rand(i,i)
	mean(x)
end