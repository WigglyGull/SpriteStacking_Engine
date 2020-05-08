local Class = {}
Class.__index = Class

function Class:New() end

function Class:derive(type)
    local cls = {}
    cls["__call"] = Class.__call
    cls.type = type
    cls.__index = cls
    cls.super = self
    setmetatable(cls, self)
    return cls
end

function Class:__call(...)
    local inst = setmetatable({}, self)
    inst:New(...)
    return inst
end

function Class:GetType()
    return self.type 
end

return Class