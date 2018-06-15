--Shader learning

function love.load()
  ond = love.graphics.newImage("lif.png")
  local shader = love.graphics.newShader[[

      vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {

        if (screen_coords.x > 300) {
          return vec4(0.0, 0.0, 1.0, 1.0);
        } else {
          return vec4(0.0, 1.0, 0.0, 0.25);
        }

      }




  ]]

  --shader2 = love.graphics.newShader("downloaded-shaders/shader.glsl")
  shader2 = love.graphics.newShader("haf.glsl")

  canv = love.graphics.newCanvas(600, 400)
  canv_w = canv:getWidth()
  canv_h = canv:getHeight()
  --time = 0;
  --shader:send("screenWidth", canv_w)
  --shader:send("screenHeight", love.graphics.getHeight())



end

function love.update(dt)
  --time = dt + time
  mx, my = love.mouse.getPosition()
  --shader2:send('iResolution', {canv_w, canv_h, 1})
  --shader2:send('iMouse', {love.mouse.getX(), love.mouse.getY(), 0, 0})
  --shader2:send('iTime', time)
end

function love.draw()

  love.graphics.setCanvas(canv)
  love.graphics.setShader(shader2)
  love.graphics.setCanvas()
  love.graphics.draw(canv)


end
