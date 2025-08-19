local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Asegúrate de que este script se ejecuta solo en un exploit o entorno controlado
-- Crear BodyVelocity para volar y moverse rápido
local bodyVelocity = Instance.new("BodyVelocity")
bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000) -- Máxima fuerza
bodyVelocity.Velocity = Vector3.new(150, 50, 0)  -- Supervelocidad y vuelo
bodyVelocity.Parent = rootPart

-- Crear BodyGyro para mantener la orientación correcta
local bodyGyro = Instance.new("BodyGyro")
bodyGyro.MaxTorque = Vector3.new(400000, 400000, 400000)  -- Fijar la orientación
bodyGyro.CFrame = rootPart.CFrame
bodyGyro.Parent = rootPart

-- Simular un salto alto, usando BodyVelocity para controlar el movimiento
local jumpForce = Instance.new("BodyVelocity")
jumpForce.MaxForce = Vector3.new(100000, 100000, 100000)
jumpForce.Velocity = Vector3.new(0, 100, 0)  -- Fuerza de salto hacia arriba
jumpForce.Parent = rootPart

-- Mantener los efectos por 5 segundos
wait(5)

-- Detener el vuelo y la supervelocidad
bodyVelocity:Destroy()
bodyGyro:Destroy()
jumpForce:Destroy()
