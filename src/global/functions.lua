function StartGame()
  GAME.STATUS = 'start'
end

function ResumeGame()
  GAME.STATUS = 'playing'
end

function QuitGame()
  love.event.quit()
end