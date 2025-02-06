function choice = atmSystem()

    fprintf("1. Check balance\n 2. Deposit Money \n 3. Withdraw money");
    c = input("Enter something nigga: ");
    
    switch c 
        case 1
            choice = "You picked 1";
        
        case 2
            choice = "You picked 2";

        case 3
            choice = "You picked 3";

        case 4 
            choice = "You picked 4";

        otherwise
            choice = "Nigga wrong choice";
    end
