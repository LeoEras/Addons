local E, L, V, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local S = E:GetModule('Skins')

local function LoadSkin()
	if(not E.private.skins.blizzard.questChoice) then return end
	for i = 1, 4 do
		local option = QuestChoiceFrame["Option"..i]
		local rewards = option.Rewards
		local item = rewards.Item
		local icon = item.Icon
		local currencies = rewards.Currencies

		item.IconBorder:SetAlpha(0)
		S:HandleIcon(icon)
		icon:SetDrawLayer("ARTWORK")

		for j = 1, 3 do
			local cu = currencies["Currency"..j]
			S:HandleIcon(cu.Icon)
		end
	end

	QuestChoiceFrame:CreateBackdrop("Transparent")
	S:HandleButton(QuestChoiceFrame.Option1.OptionButton)
	S:HandleButton(QuestChoiceFrame.Option2.OptionButton)
	S:HandleButton(QuestChoiceFrame.Option3.OptionButton)
	S:HandleButton(QuestChoiceFrame.Option4.OptionButton)
	S:HandleCloseButton(QuestChoiceFrame.CloseButton)
	QuestChoiceFrame.CloseButton:SetFrameLevel(10)
end

S:AddCallbackForAddon("Blizzard_QuestChoice", "QuestChoice", LoadSkin)
