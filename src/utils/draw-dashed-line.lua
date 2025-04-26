local function drawDashedLine(x1, y1, x2, y2, dashLength, gapLength)
  local dx, dy = x2 - x1, y2 - y1
  local distance = math.sqrt(dx * dx + dy * dy)
  local angle = math.atan2(dy, dx)

  local currentLength = 0

  while currentLength < distance do
    local startX = x1 + math.cos(angle) * currentLength
    local startY = y1 + math.sin(angle) * currentLength

    local endLength = math.min(dashLength, distance - currentLength)
    local endX = startX + math.cos(angle) * endLength
    local endY = startY + math.sin(angle) * endLength

    LG.line(startX, startY, endX, endY)

    currentLength = currentLength + dashLength + gapLength
  end
end

return drawDashedLine
