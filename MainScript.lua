local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Crear BodyVelocity vacío para no forzar movimiento
local bodyVelocity = Instance.new("BodyVelocity")
bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
bodyVelocity.Velocity = Vector3.new(0, 0, 0) -- No mueve al jugador automáticamente
bodyVelocity.Parent = rootPart

-- Crear BodyGyro para mantener orientación
local bodyGyro = Instance.new("BodyGyro")
bodyGyro.MaxTorque = Vector3.new(400000, 400000, 400000)
bodyGyro.CFrame = rootPart.CFrame
bodyGyro.Parent = rootPart

-- Conexión para actualizar velocidad en base al movimiento del jugador
local humanoid = character:WaitForChild("Humanoid")

game:GetService("RunService").RenderStepped:Connect(function()
    -- Actualizar orientación
    bodyGyro.CFrame = workspace.CurrentCamera.CFrame

    -- Aplicar velocidad del humanoide (WASD) al BodyVelocity
    local moveDirection = humanoid.MoveDirection
    bodyVelocity.Velocity = Vector3.new(moveDirection.X * 50, rootPart.Velocity.Y, moveDirection.Z * 50)
end)

print("Ahora puedes moverte libremente con WASD, sin que te arrastre solo.")
