---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Abou.
--- DateTime: 21/12/2023 01:18
---

_cn.SkinComponent = "SkinComponent";
loadClass(_cn.SkinComponent)

--- Imports ---

---@class SkinComponent : Component
local SkinComponent = extends(_cn.SkinComponent, _cn.Component);

function SkinComponent.new()
    ---@type SkinComponent
    local self = initMetatable(SkinComponent);

    self.skin = skin or nil
    self.character = {}
    self.skinComponents = {
        { label = 'Sex', name = 'sex', value = 1, min = 1, zoomOffset = 0.6, camOffset = 0.65 },
        { label = 'Mother', name = 'mom', value = 21, min = 21, zoomOffset = 0.6, camOffset = 0.65 },
        { label = 'Father', name = 'dad', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65 },
        { label = 'Resemblance', name = 'face_md_weight', value = 50, min = 0, zoomOffset = 0.6, camOffset = 0.65 },
        { label = 'Mother’s Skin Tone', name = 'mom_color', value = 50, min = 0, zoomOffset = 0.6, camOffset = 0.65 },
        { label = 'Father’s Skin Tone', name = 'dad_color', value = 50, min = 0, zoomOffset = 0.6, camOffset = 0.65 },
        { label = 'Nose Width', name = 'nose_1', value = 0, min = -10, zoomOffset = 0.6, camOffset = 0.65 },
        { label = 'Nose Peak Height', name = 'nose_2', value = 0, min = -10, zoomOffset = 0.6, camOffset = 0.65 },
        { label = 'Nose Peak Length', name = 'nose_3', value = 0, min = -10, zoomOffset = 0.6, camOffset = 0.65 },
        { label = 'Nose Bridge Height', name = 'nose_4', value = 0, min = -10, zoomOffset = 0.6, camOffset = 0.65 },
        { label = 'Nose Peak Lowering', name = 'nose_5', value = 0, min = -10, zoomOffset = 0.6, camOffset = 0.65 },
        { label = 'Nose Bridge Twist', name = 'nose_6', value = 0, min = -10, zoomOffset = 0.6, camOffset = 0.65 },
        { label = 'Cheekbone Height', name = 'cheeks_1', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Cheekbone Width', name = 'cheeks_2', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Cheek Width', name = 'cheeks_3', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Lip Fullness', name = 'lip_thickness', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Jaw Bone Width', name = 'jaw_1', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Jaw Bone Length', name = 'jaw_2', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Chin Height', name = 'chin_1', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Chin Length', name = 'chin_2', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Chin Width', name = 'chin_3', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Chin Bottom', name = 'chin_4', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Neck Thickness', name = 'neck_thickness', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Hair Style', name = 'hair_1', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65 },
        { label = 'Hair Texture', name = 'hair_2', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65 },
        { label = 'Hair Color 1', name = 'hair_color_1', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65 },
        { label = 'Hair Color 2', name = 'hair_color_2', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65 },
        { label = 'Eye Color', name = 'eye_color', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Eye Squint', name = 'eye_squint', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Eyebrow Size', name = 'eyebrows_2', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Eyebrow Type', name = 'eyebrows_1', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Eyebrow Color 1', name = 'eyebrows_3', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Eyebrow Color 2', name = 'eyebrows_4', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Eyebrow Height', name = 'eyebrows_5', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Eyebrow Depth', name = 'eyebrows_6', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Makeup Type', name = 'makeup_1', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Makeup Thickness', name = 'makeup_2', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Makeup Color 1', name = 'makeup_3', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Makeup Color 2', name = 'makeup_4', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Lipstick Type', name = 'lipstick_1', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Lipstick Thickness', name = 'lipstick_2', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Lipstick Color 1', name = 'lipstick_3', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Lipstick Color 2', name = 'lipstick_4', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Ear Accessories', name = 'ears_1', value = -1, min = -1, zoomOffset = 0.4, camOffset = 0.65, componentId = 2 },
        { label = 'Ear Accessories Color', name = 'ears_2', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65, textureof = 'ears_1' },
        { label = 'Chest Hair', name = 'chest_1', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15 },
        { label = 'Chest Hair Thickness', name = 'chest_2', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15 },
        { label = 'Chest Hair Color', name = 'chest_3', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15 },
        { label = 'Body Blemishes', name = 'bodyb_1', value = -1, min = -1, zoomOffset = 0.75, camOffset = 0.15 },
        { label = 'Body Blemishes Opacity', name = 'bodyb_2', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15 },
        { label = 'Body Imperfections', name = 'bodyb_extra', value = -1, min = -1, zoomOffset = 0.4, camOffset = 0.15 },
        { label = 'Imperfections Thickness', name = 'bodyb_extra_thickness', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.15 },
        { label = 'Wrinkles', name = 'age_1', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Wrinkle Thickness', name = 'age_2', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Blemishes', name = 'blemishes_1', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Blemishes Opacity', name = 'blemishes_2', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Blush', name = 'blush_1', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Blush Opacity', name = 'blush_2', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Blush Color', name = 'blush_3', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Complexion', name = 'complexion_1', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Complexion Opacity', name = 'complexion_2', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Sun Damage', name = 'sun_1', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Sun Damage Opacity', name = 'sun_2', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Freckles', name = 'moles_1', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Freckles Opacity', name = 'moles_2', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Beard Type', name = 'beard_1', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Beard Size', name = 'beard_2', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Beard Color 1', name = 'beard_3', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 },
        { label = 'Bulletproof Vest 1', name = 'bproof_1', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, componentId = 9 },
        { label = 'Bulletproof Vest 2', name = 'bproof_2', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, textureof = 'bproof_1' },
    }
    self.clothesComponents = {
        { label = 'Arms', name = 'arms', value = 0, min = 0 },
        { label = 'Arms 2', name = 'arms_2', value = 0, min = 0 },
        { label = 'T-Shirt 1', name = 'tshirt_1', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, componentId = 8 },
        { label = 'T-Shirt 2', name = 'tshirt_2', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, textureof = 'tshirt_1' },
        { label = 'Torso 1', name = 'torso_1', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, componentId = 11 },
        { label = 'Torso 2', name = 'torso_2', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, textureof = 'torso_1' },
        { label = 'Decals 1', name = 'decals_1', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, componentId = 10 },
        { label = 'Decals 2', name = 'decals_2', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, textureof = 'decals_1' },
        { label = 'Pants 1', name = 'pants_1', value = 0, min = 0, zoomOffset = 0.8, camOffset = -0.5, componentId = 4 },
        { label = 'Pants 2', name = 'pants_2', value = 0, min = 0, zoomOffset = 0.8, camOffset = -0.5, textureof = 'pants_1' },
        { label = 'Shoes 1', name = 'shoes_1', value = 0, min = 0, zoomOffset = 0.8, camOffset = -0.8, componentId = 6 },
        { label = 'Shoes 2', name = 'shoes_2', value = 0, min = 0, zoomOffset = 0.8, camOffset = -0.8, textureof = 'shoes_1' },
        { label = 'Mask 1', name = 'mask_1', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65, componentId = 1 },
        { label = 'Mask 2', name = 'mask_2', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65, textureof = 'mask_1' },
        { label = 'Chain 1', name = 'chain_1', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65, componentId = 7 },
        { label = 'Chain 2', name = 'chain_2', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65, textureof = 'chain_1' },
        { label = 'Helmet 1', name = 'helmet_1', value = -1, min = -1, zoomOffset = 0.6, camOffset = 0.65, componentId = 0 },
        { label = 'Helmet 2', name = 'helmet_2', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65, textureof = 'helmet_1' },
        { label = 'Glasses 1', name = 'glasses_1', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65, componentId = 1 },
        { label = 'Glasses 2', name = 'glasses_2', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65, textureof = 'glasses_1' },
        { label = 'Watch 1', name = 'watches_1', value = -1, min = -1, zoomOffset = 0.75, camOffset = 0.15, componentId = 6 },
        { label = 'Watch 2', name = 'watches_2', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, textureof = 'watches_1' },
        { label = 'Bracelet 1', name = 'bracelets_1', value = -1, min = -1, zoomOffset = 0.75, camOffset = 0.15, componentId = 7 },
        { label = 'Bracelet 2', name = 'bracelets_2', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, textureof = 'bracelets_1' },
        { label = 'Bag 1', name = 'bag_1', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, componentId = 5 },
        { label = 'Bag 2', name = 'bag_2', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, textureof = 'bag_1' },
    }

    self.indexComponents = {
        ["self.skinComponents"] = self.skinComponents,
        ["self.clothesComponents"] = self.clothesComponents,
    }

    for _, component in pairs(self.indexComponents) do
        for i = 1, #component do
            local comp = component[i]
            self.character[comp.name] = comp.value
        end
    end

    if self.isHeroe then
        print("Heroe skin is", self.skin)
    end
    return self;
end

function SkinComponent:testSkinComponent()

end

function SkinComponent:getMaxValues()

    local pedId = self.entity;

    local data = {
        sex = 332,
        face = 45,
        skin = 45,
        age_1 = GetNumHeadOverlayValues(3) - 1,
        age_2 = 10,
        beard_1 = GetNumHeadOverlayValues(1) - 1,
        beard_2 = 10,
        beard_3 = GetNumHairColors() - 1,
        beard_4 = GetNumHairColors() - 1,
        hair_1 = GetNumberOfPedDrawableVariations(pedId, 2) - 1,
        hair_2 = GetNumberOfPedTextureVariations(pedId, 2, self.character['hair_1']) - 1,
        hair_color_1 = GetNumHairColors() - 1,
        hair_color_2 = GetNumHairColors() - 1,
        eyebrows_1 = GetNumHeadOverlayValues(2) - 1,
        eyebrows_2 = 10,
        eyebrows_3 = GetNumHairColors() - 1,
        eyebrows_4 = GetNumHairColors() - 1,
        makeup_1 = GetNumHeadOverlayValues(4) - 1,
        makeup_2 = 10,
        makeup_3 = GetNumHairColors() - 1,
        makeup_4 = GetNumHairColors() - 1,
        lipstick_1 = GetNumHeadOverlayValues(8) - 1,
        lipstick_2 = 10,
        lipstick_3 = GetNumHairColors() - 1,
        lipstick_4 = GetNumHairColors() - 1,
        ears_1 = GetNumberOfPedPropDrawableVariations(pedId, 1) - 1,
        ears_2 = GetNumberOfPedPropTextureVariations(pedId, 1, self.character['ears_1'] - 1),
        tshirt_1 = GetNumberOfPedDrawableVariations(pedId, 8) - 1,
        tshirt_2 = GetNumberOfPedTextureVariations(pedId, 8, self.character['tshirt_1']) - 1,
        torso_1 = GetNumberOfPedDrawableVariations(pedId, 11) - 1,
        torso_2 = GetNumberOfPedTextureVariations(pedId, 11, self.character['torso_1']) - 1,
        decals_1 = GetNumberOfPedDrawableVariations(pedId, 10) - 1,
        decals_2 = GetNumberOfPedTextureVariations(pedId, 10, self.character['decals_1']) - 1,
        arms = GetNumberOfPedDrawableVariations(pedId, 3) - 1,
        pants_1 = GetNumberOfPedDrawableVariations(pedId, 4) - 1,
        pants_2 = GetNumberOfPedTextureVariations(pedId, 4, self.character['pants_1']) - 1,
        shoes_1 = GetNumberOfPedDrawableVariations(pedId, 6) - 1,
        shoes_2 = GetNumberOfPedTextureVariations(pedId, 6, self.character['shoes_1']) - 1,
        mask_1 = GetNumberOfPedDrawableVariations(pedId, 1) - 1,
        mask_2 = GetNumberOfPedTextureVariations(pedId, 1, self.character['mask_1']) - 1,
        bproof_1 = GetNumberOfPedDrawableVariations(pedId, 9) - 1,
        bproof_2 = GetNumberOfPedTextureVariations(pedId, 9, self.character['bproof_1']) - 1,
        chain_1 = GetNumberOfPedDrawableVariations(pedId, 7) - 1,
        chain_2 = GetNumberOfPedTextureVariations(pedId, 7, self.character['chain_1']) - 1,
        bags_1 = GetNumberOfPedDrawableVariations(pedId, 5) - 1,
        bags_2 = GetNumberOfPedTextureVariations(pedId, 5, self.character['bags_1']) - 1,
        helmet_1 = GetNumberOfPedPropDrawableVariations(pedId, 0) - 1,
        helmet_2 = GetNumberOfPedPropTextureVariations(pedId, 0, self.character['helmet_1']) - 1,
        glasses_1 = GetNumberOfPedPropDrawableVariations(pedId, 1) - 1,
        glasses_2 = GetNumberOfPedPropTextureVariations(pedId, 1, self.character['glasses_1'] - 1),
    }

    return data
end

function SkinComponent:applySkin(skin, clothes)

    local playerPed = GetPlayerPed(-1)

    for k, v in pairs(skin) do
        self.character[k] = v
    end

    if clothes ~= nil then

        for k, v in pairs(clothes) do
            if
            k ~= 'sex' and
                    k ~= 'face' and
                    k ~= 'skin' and
                    k ~= 'age_1' and
                    k ~= 'age_2' and
                    k ~= 'beard_1' and
                    k ~= 'beard_2' and
                    k ~= 'beard_3' and
                    k ~= 'beard_4' and
                    k ~= 'hair_1' and
                    k ~= 'hair_2' and
                    k ~= 'hair_color_1' and
                    k ~= 'hair_color_2' and
                    k ~= 'eyebrows_1' and
                    k ~= 'eyebrows_2' and
                    k ~= 'eyebrows_3' and
                    k ~= 'eyebrows_4' and
                    k ~= 'makeup_1' and
                    k ~= 'makeup_2' and
                    k ~= 'makeup_3' and
                    k ~= 'makeup_4' and
                    k ~= 'lipstick_1' and
                    k ~= 'lipstick_2' and
                    k ~= 'lipstick_3' and
                    k ~= 'lipstick_4'
            then
                self.character[k] = v
            end
        end

    end

    SetPedHeadBlendData(playerPed, self.character['face'], self.character['face'], self.character['face'], self.character['skin'], self.character['skin'], self.character['skin'], 1.0, 1.0, 1.0, true)

    SetPedHairColor(playerPed, self.character['hair_color_1'], self.character['hair_color_2'])           -- Hair Color
    SetPedHeadOverlay(playerPed, 3, self.character['age_1'], (self.character['age_2'] / 10) + 0.0)      -- Age + opacity
    SetPedHeadOverlay(playerPed, 1, self.character['beard_1'], (self.character['beard_2'] / 10) + 0.0)    -- Beard + opacity
    SetPedHeadOverlay(playerPed, 2, self.character['eyebrows_1'], (self.character['eyebrows_2'] / 10) + 0.0) -- Eyebrows + opacity
    SetPedHeadOverlay(playerPed, 4, self.character['makeup_1'], (self.character['makeup_2'] / 10) + 0.0)   -- Makeup + opacity
    SetPedHeadOverlay(playerPed, 8, self.character['lipstick_1'], (self.character['lipstick_2'] / 10) + 0.0) -- Lipstick + opacity
    SetPedComponentVariation(playerPed, 2, self.character['hair_1'], self.character['hair_2'], 2)              -- Hair
    SetPedHeadOverlayColor(playerPed, 1, 1, self.character['beard_3'], self.character['beard_4'])                -- Beard Color
    SetPedHeadOverlayColor(playerPed, 2, 1, self.character['eyebrows_3'], self.character['eyebrows_4'])             -- Eyebrows Color
    SetPedHeadOverlayColor(playerPed, 4, 1, self.character['makeup_3'], self.character['makeup_4'])               -- Makeup Color
    SetPedHeadOverlayColor(playerPed, 8, 1, self.character['lipstick_3'], self.character['lipstick_4'])             -- Lipstick Color

    if self.character['ears_1'] == -1 then
        ClearPedProp(playerPed, 2)
    else
        SetPedPropIndex(playerPed, 2, self.character['ears_1'], self.character['ears_2'], 2)  -- Ears Accessories
    end

    SetPedComponentVariation(playerPed, 8, self.character['tshirt_1'], self.character['tshirt_2'], 2)     -- Tshirt
    SetPedComponentVariation(playerPed, 11, self.character['torso_1'], self.character['torso_2'], 2)      -- torso parts
    SetPedComponentVariation(playerPed, 3, self.character['arms'], 0, 2)                              -- torso
    SetPedComponentVariation(playerPed, 10, self.character['decals_1'], self.character['decals_2'], 2)     -- decals
    SetPedComponentVariation(playerPed, 4, self.character['pants_1'], self.character['pants_2'], 2)      -- pants
    SetPedComponentVariation(playerPed, 6, self.character['shoes_1'], self.character['shoes_2'], 2)      -- shoes
    SetPedComponentVariation(playerPed, 1, self.character['mask_1'], self.character['mask_2'], 2)       -- mask
    SetPedComponentVariation(playerPed, 9, self.character['bproof_1'], self.character['bproof_2'], 2)     -- bulletproof
    SetPedComponentVariation(playerPed, 7, self.character['chain_1'], self.character['chain_2'], 2)      -- chain
    SetPedComponentVariation(playerPed, 5, self.character['bags_1'], self.character['bags_2'], 2)       -- Bag

    if self.character['helmet_1'] == -1 then
        ClearPedProp(playerPed, 0)
    else
        SetPedPropIndex(playerPed, 0, self.character['helmet_1'], self.character['helmet_2'], 2)  -- Helmet
    end

    SetPedPropIndex(playerPed, 1, self.character['glasses_1'], self.character['glasses_2'], 2)  -- Glasses
end

_c.SkinComponent = SkinComponent;
classloaded(_cn.SkinComponent)