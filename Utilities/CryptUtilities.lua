--[[ 
    This Utility file utilizes the built in Executor functions in the 'crypt' table.
    I'm not sure what Executors have these functions, but to my knowledge, 
    Krampus Windows, CodeX Android/iOS, and Hydrogen MacOS both support these functions.
    I have not tested any other Executor. I think Wave Windows, and Acerus X Android/iOS work but I don't know.

    I've created this utility to simplify the usage of these functions for myself and to enhance the readability of my code for others.

    This code isn't commented at all, mainly because of how simple and self explanatory it is.
    Realistically you don't need to use this, but I feel like it makes your code cleaner.

    Unfortunately, the 'crypt' table doesn't support every single hash algorithm, but I have included
    all the ones it has here.

    List of supported algorithms if you don't wanna read the code:
        Encryption: GCM AES Encryption & Decryption
        Hashing: md5, sha1, sha3-224, sha3-256, and sha3-512
        Other: 
]]

local Utils = loadstring(game:HttpGet("https://github.com/ARK-Mercenary/Roblox-Mercenary/raw/main/Utilities/Utilities.lua"))()

local CryptUtilities = {} do
    CryptUtilities.Encrypt = crypt.encrypt
    CryptUtilities.Decrypt = crypt.decrypt
    CryptUtilities.Hash = crypt.hash

    function CryptUtilities:Encrypt(data, key, iv)
        task.spawn(function()
            return
        end)
    end

    function CryptUtilities:Decrypt(data, key, iv)
        task.spawn(function()
            return
        end)
    end

    function CryptUtilities:MD5(data)
        task.spawn(function()
            Utils:CheckFunctionExists(self.Hash)

            return self.Hash(data, "md5")
        end)
    end

    function CryptUtilities:SHA1(data)
        task.spawn(function()
            Utils:CheckFunctionExists(self.Hash)

            return self.Hash(data, "sha1")
        end)
    end

    function CryptUtilities:SHA224(data)
        task.spawn(function()
            Utils:CheckFunctionExists(self.Hash)

            return self.Hash(data, "sha3-224")
        end)
    end

    function CryptUtilities:SHA256(data)
        task.spawn(function()
            Utils:CheckFunctionExists(self.Hash)

            return self.Hash(data, "sha3-256")
        end)
    end

    function CryptUtilities:SHA512(data)
        task.spawn(function()
            Utils:CheckFunctionExists(self.Hash)

            return self.Hash(data, "sha3-512")
        end)
    end
end

return CryptUtilities
