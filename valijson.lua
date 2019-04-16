-- scaffold geniefile for valijson

valijson_script = path.getabsolute(path.getdirectory(_SCRIPT))
valijson_root = path.join(valijson_script, "valijson")

valijson_includedirs = {
	path.join(valijson_script, "config"),
	valijson_root,
}

valijson_libdirs = {}
valijson_links = {}
valijson_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { valijson_includedirs }
	end,

	_add_defines = function()
		defines { valijson_defines }
	end,

	_add_libdirs = function()
		libdirs { valijson_libdirs }
	end,

	_add_external_links = function()
		links { valijson_links }
	end,

	_add_self_links = function()
		links { "valijson" }
	end,

	_create_projects = function()

project "valijson"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		valijson_includedirs,
	}

	defines {}

	files {
		path.join(valijson_script, "config", "**.h"),
		path.join(valijson_root, "**.h"),
		path.join(valijson_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
