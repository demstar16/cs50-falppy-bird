PauseState = Class { __includes = BaseState }

function PauseState:enter(params)
    self.score = params.score
    self.pipePairs = params.pipePairs
    self.bird = params.bird
end

function PauseState:update(dt)
    if love.keyboard.wasPressed('p') then
        NOT_PAUSED = true
        WAS_PAUSED = true
        gStateMachine:change('play',
            { score = self.score, bird = self.bird, pipePairs = self.pipePairs })
    end

end

function PauseState:render()
    -- simple UI code
    for k, pair in pairs(self.pipePairs) do
        pair:render()
    end
    
    self.bird:render()
    
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Paused', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Press P to Play', 0, 100, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(hugeFont)
    love.graphics.printf('II', 0, 130, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(flappyFont)
    love.graphics.print('Score: ' .. tostring(self.score), 8, 8)
end
