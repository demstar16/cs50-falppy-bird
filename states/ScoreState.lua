--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
    if self.score < 5 then
        self.award = love.graphics.newImage('poo.png')
    elseif self.score < 10 then
        self.award = love.graphics.newImage('badge.png')
    elseif self.score < 20 then
        self.award = love.graphics.newImage('trophy.png')        
    else
        self.award = love.graphics.newImage('crown.png')
    end
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('You Died!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')
    love.graphics.printf("You've earnt a...", 0, 130, VIRTUAL_WIDTH, 'center')

    love.graphics.draw(self.award, (VIRTUAL_WIDTH / 2) - 20, 150, 0, 0.1, 0.1)

    love.graphics.printf('Press Enter to Play Again!', 0, 210, VIRTUAL_WIDTH, 'center')
end