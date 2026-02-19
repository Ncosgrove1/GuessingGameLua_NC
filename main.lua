--- [START] ---

-- Function to condense the Guessing Game logic
local function playGuessingGame()
    -- random number generator seed
    math.randomseed(os.time())

    -- Replay Loop
    while true do
        -- Initialize Game Variables
        local targetNumber = math.random(1, 100)
        local maxAttempts = 7
        local attemptsLeft = maxAttempts
        local hasWon = false

        print("\n--- Welcome to the Number Guessing Game! ---")
        print("There is a number between 1 and 100.")
        print("You have " .. maxAttempts .. " attempts to guess it correctly. Good luck!")

        -- Core Game Loop
        while attemptsLeft > 0 and not hasWon do
            print("\nAttempts left: " .. attemptsLeft)
            io.write("Enter your guess: ")

            local input = io.read()
            local userGuess = tonumber(input)

            -- Validate Input
            if userGuess == nil then
                print("Invalid input. Please enter a number.")
            else
                -- Check Guess
                if userGuess == targetNumber then
                    print("Correct! You guessed the number!")
                    hasWon = true
                elseif userGuess < targetNumber then
                    print("Too low!")
                    attemptsLeft = attemptsLeft - 1
                else
                    print("Too high!")
                    attemptsLeft = attemptsLeft - 1
                end
            end
        end

        -- Win/Loss Message
        if not hasWon then
            print("\nGame Over! The number was: " .. targetNumber)
        end

        -- Replay Option
        io.write("\nWould you like to play again? (yes/no): ")
        local playAgain = io.read():lower()

        if playAgain ~= "yes" and playAgain ~= "y" then
            print("Thanks for playing!")
            break -- Exit the replay loop
        end
    end
end

--- [END] ---

-- Run the function
playGuessingGame()
