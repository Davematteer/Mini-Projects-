function result = simpleCalculator(num1,num2,op)
    switch op
        case "+"
            result = num1 + num2;

        case "-"
            result = num1-num2;

        case "*"
            result = num1 * num2;

        case "/"
            if num2 == 0
                result = "invalid operation";
            
            else
                result = num1 / num2 ;

            end

        otherwise 
            result = "wrong operator";

    end


