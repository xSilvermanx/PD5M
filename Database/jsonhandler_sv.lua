local resource_name = GetCurrentResourceName()

function json_GetFile(filename)
    local loaded_data = LoadResourceFile(resource_name, "Database/DatabaseFiles/" .. filename .. ".json")
    local file_data = json.decode(loaded_data or '{}')
    return file_data
end

function json_GetItem(filename, itemname)
    local loaded_data = LoadResourceFile(resource_name, "Database/DatabaseFiles/" .. filename .. ".json")
    local file_data = json.decode(loaded_data or "{}")
    return file_data[itemname]
end

function json_AddItem(filename, itemname, itemcontent)
    local loaded_data = LoadResourceFile(resource_name, "Database/DatabaseFiles/" .. filename .. ".json")
    local file_data = json.decode(loaded_data or '{}')
    file_data[itemname] = itemcontent
    SaveResourceFile(resource_name, "Database/DatabaseFiles/" .. filename .. ".json", json.encode(file_data, { indent = true }), -1)
end

function json_DeleteItem(filename, itemname)
    local loaded_data = LoadResourceFile(resource_name, "Database/DatabaseFiles/" .. filename .. ".json")
    local file_data = json.decode(loaded_data or '{}')
    if file_data[itemname] ~= nil then
        file_data[itemname] = nil
        SaveResourceFile(resource_name, "Database/DatabaseFiles/" .. filename .. ".json", json.encode(file_data, { indent = true }), -1)
    else
        print("^1[ERROR][" .. resource_name .. "]^7 Attempted to delete a non-existing item.")
        return
    end
end

function json_ReplaceItem(filename, itemname, itemcontent)
    local loaded_data = LoadResourceFile(resource_name, "Database/DatabaseFiles/" .. filename .. ".json")
    local file_data = json.decode(loaded_data or '{}')
    if file_data[itemname] ~= nil then
        file_data[itemname] = itemcontent
        SaveResourceFile(resource_name, "Database/DatabaseFiles/" .. filename .. ".json", json.encode(file_data, { indent = true }), -1)
    else
        print("^1[ERROR][" .. resource_name .. "]^7 Attempted to replace a non-existing item.")
        return
    end
end

function json_ReplaceData(filename, itemname, table)
    local loaded_data = LoadResourceFile(resource_name, "Database/DatabaseFiles/" .. filename .. ".json")
    local file_data = json.decode(loaded_data or '{}')
    for k, v in ipairs(table) do
        local name = table[k].name
        local value = table[k].content
        if file_data[itemname][name] ~= nil then
            file_data[itemname][name] = value
            SaveResourceFile(resource_name, "Database/DatabaseFiles/" .. filename .. ".json", json.encode(file_data, { indent = true }), -1)
        else
            print("^1[ERROR][" .. resource_name .. "]^7 Attempted to replace a non-existing data (^3" .. name .. "^7) within ^3" .. itemname .. "^7 in file ^3" .. filename .. ".json^7")
        end
    end
end

function json_DeleteData(filename, itemname, dataname)
    local loaded_data = LoadResourceFile(resource_name, "Database/DatabaseFiles/" .. filename .. ".json")
    local file_data = json.decode(loaded_data or '{}')
    if file_data[itemname][dataname] ~= nil then
        file_data[itemname][dataname] = nil
        SaveResourceFile(resource_name, "Database/DatabaseFiles/" .. filename .. ".json", json.encode(file_data, { indent = true }), -1)
    else
        print("^1[ERROR][" .. resource_name .. "]^7 Attempted to delete a non-existing data (^3" .. dataname .. "^7) within ^3" .. itemname .. "^7 in file ^3" .. filename .. ".json^7")
    end
end

--Combined function
function json_InitiateFile(filename)
    local self = {}

    self.filename = filename
    self.loaded_data = LoadResourceFile(resource_name, "Database/DatabaseFiles/" .. self.filename .. ".json")
    self.file_data = json.decode(self.loaded_data or "{}")

    self.GetFile = function()
        return self.file_data
    end

    self.GetItem = function(itemname)
        return self.file_data[itemname]
    end

    self.AddItem = function(itemname, itemcontent)
        self.file_data[itemname] = itemcontent
        SaveResourceFile(resource_name, "Database/DatabaseFiles/" .. self.filename .. ".json", json.encode(self.file_data, { indent = true }), -1)
    end

    self.DeleteItem = function(itemname)
        if self.file_data[itemname] ~= nil then
            self.file_data[itemname] = nil
            SaveResourceFile(resource_name, "Database/DatabaseFiles/" .. self.filename .. ".json", json.encode(self.file_data, { indent = true }), -1)
        else
            print("^1[ERROR][" .. resource_name .. "]^7 Attempted to delete a non-existing item.")
            return
        end
    end

    self.ReplaceItem = function(itemname, itemcontent)
        if self.file_data[itemname] ~= nil then
            self.file_data[itemname] = itemcontent
            SaveResourceFile(resource_name, "Database/DatabaseFiles/" .. self.filename .. ".json", json.encode(self.file_data, { indent = true }), -1)
        else
            print("^1[ERROR][" .. resource_name .. "]^7 Attempted to replace a non-existing item.")
            return
        end
    end

    self.ReplaceData = function(itemname, table)
        for k, v in ipairs(table) do
            local name = table[k].name
            local value = table[k].content
            if self.file_data[itemname][name] ~= nil then
                self.file_data[itemname][name] = value
                SaveResourceFile(resource_name, "Database/DatabaseFiles/" .. self.filename .. ".json", json.encode(self.file_data, { indent = true }), -1)
            else
                print("^1[ERROR][" .. resource_name .. "]^7 Attempted to replace a non-existing data (^3" .. name .. "^7) within ^3" .. itemname .. "^7 in file ^3" .. self.filename .. ".json^7")
            end
        end
    end

    self.DeleteData = function(itemname, dataname)
        if self.file_data[itemname][dataname] ~= nil then
            self.file_data[itemname][dataname] = nil
            SaveResourceFile(resource_name, "Database/DatabaseFiles/" .. self.filename .. ".json", json.encode(self.file_data, { indent = true }), -1)
        else
            print("^1[ERROR][" .. resource_name .. "]^7 Attempted to delete a non-existing data (^3" .. dataname .. "^7) within ^3" .. itemname .. "^7 in file ^3" .. self.filename .. ".json^7")
        end
    end

    return self
end
