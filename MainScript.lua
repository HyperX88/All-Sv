local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Super velocidad (solo correr más rápido, sin volar)
local bodyVelocity = Instance.new("BodyVelocity")
bodyVelocity.MaxForce = Vector3.new(100000, 0, 100000) -- Solo horizontal (X,Z), no en Y
bodyVelocity.Velocity = Vector3.new(150, 0, 0)         -- Velocidad hacia adelante
bodyVelocity.Parent = rootPart

-- Super salto infinito (impulso solo hacia arriba cuando saltas)
local jumpForce = Instance.new("BodyVelocity")
jumpForce.MaxForce = Vector3.new(0, 100000, 0) -- Solo vertical (Y)
jumpForce.Velocity = Vector3.new(0, 100, 0)   -- Impulso hacia arriba
jumpForce.Parent = rootPart

print("Speed and SuperJump are now infinite! (No Fly)")
