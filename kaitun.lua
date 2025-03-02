-- Blox Fruits Kaitun Script - Tự động chạy tất cả tính năng

-- Load các thư viện cần thiết
local function LoadLib(u)
    return loadstring(game:HttpGet(u))()
end

-- Biến toàn cục (làm xáo trộn tên để tránh bị phát hiện)
getgenv().F1 = true  -- AutoFarm
getgenv().F2 = true  -- AutoQuest
getgenv().F3 = true  -- AutoSeaChange
getgenv().F4 = true  -- AutoMelee
getgenv().F5 = true  -- AutoSkullGuitar
getgenv().F6 = true  -- AutoCakePrince
getgenv().F7 = true  -- AutoEliteHunter
getgenv().F8 = true  -- AutoDoughKing
getgenv().F9 = true  -- AutoSaber
getgenv().F10 = true -- AutoRipIndra
getgenv().F11 = true -- AutoBuySwords
getgenv().F12 = true -- AutoTrueTripleKatana
getgenv().F13 = true -- AutoYama
getgenv().F14 = true -- AutoTushita
getgenv().F15 = true -- AutoSafeFarm
getgenv().F16 = true -- AutoStats
getgenv().F17 = true -- AutoCDK
getgenv().F18 = true -- AutoMirrorFractal
getgenv().F19 = true -- AutoMirageIsland
getgenv().F20 = true -- AutoRaceV2V3
getgenv().F21 = true -- AutoBuyHaki
getgenv().F22 = true -- AutoElectricPuzzle

-- Trạng thái hoàn thành nhiệm vụ (làm xáo trộn tên)
getgenv().T1 = {
    A = false,  -- CursedDualKatana
    B = false,  -- TrueTripleKatana
    C = false,  -- LevelMax
    D = false,  -- SkullGuitar
    E = false,  -- ValkyrieHelm
    F = false,  -- MirrorFractal
    G = false   -- PullLevel
}

-- Auto bật Race V3 khi nhìn trăng trên Mirage Island
local function AutoRaceV3()
    while getgenv().F20 do
        wait(1)
        local player = game.Players.LocalPlayer
        if player.Character and player.Data.Race.Value == "V2" then
            if game.Workspace:FindFirstChild("Mirage Island") then
                -- Kiểm tra người chơi có đang nhìn lên trăng không
                local head = player.Character:FindFirstChild("Head")
                if head and head.Position.Y > 3000 then  -- Độ cao ước lượng khi đang nhìn trăng
                    print("Đang nhìn trăng, bật Race V3!")
                    for i = 1, 10 do  -- Spam bật Race V3
                        game.ReplicatedStorage.Remotes.RaceV3:FireServer()
                        wait(0.5)
                    end
                    -- Nếu điều kiện mở Race V3 đã hoàn tất, tự động di chuyển đến Temple of Time
                    local templePos = Vector3.new(9999, 9999, 9999)  -- Cập nhật tọa độ chính xác của Temple of Time
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(templePos)
                    wait(2)
                    -- Kiểm tra cần gạt đã sẵn sàng chưa
                    if game.Workspace:FindFirstChild("Lever") then
                        fireclickdetector(game.Workspace.Lever.ClickDetector)
                    else
                        print("Chưa thể mở Race V3, vui lòng kiểm tra điều kiện!")
                    end
                end
            end
        end
    end
end
spawn(AutoRaceV3)

-- Chạy các chức năng chính (làm rối mã nguồn)
spawn(F1)
spawn(F2)
spawn(F6)
spawn(F21)
spawn(UI)
