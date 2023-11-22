function data()
return {
	info = {
		minorVersion = 0,
		severityAdd = "NONE",
		severityRemove = "WARNING",
		name = _("mod_name"),
		description = _("mod_desc"),
		authors = {
		    {
		        name = "ModWerkstatt",
		        role = "CREATOR",
		    },
		},
		tags = { "europe", "deutschland", "germany", "schweiz", "db", "waggon", "goods", "Intermodal", },
		minGameVersion = 0,
		dependencies = { },
		url = { "" },

		params = {
			{
				key = "sggmrss90fake",
				name = _("Fake_sggmrss90_wagen"),
				values = { "No", "Yes", },
				tooltip = _("option_fake_wagen_desc"),
				defaultIndex = 0,
			},
        },
	},
	options = {
	},

	runFn = function (settings, modParams)
	local params = modParams[getCurrentModId()]

        local hidden = {
			["aae_fake.mdl"] = true,
			["aae2_fake.mdl"] = true,
			["ambrogio_fake.mdl"] = true,
			["clip_fake.mdl"] = true,
			["ermewa_fake.mdl"] = true,
			["ermewa2_fake.mdl"] = true,
			["err_fake.mdl"] = true,
			["eurowagon_fake.mdl"] = true,
			["gatx_fake.mdl"] = true,
			["gts_fake.mdl"] = true,
			["hupac_fake.mdl"] = true,
			["hupac2_fake.mdl"] = true,
			["mfd_fake.mdl"] = true,
			["vtg_fake.mdl"] = true,
			["wascosa_fake.mdl"] = true,
        }

		local modelFilter = function(fileName, data)
			local modelName = fileName:match('/sggmrss90_([^/]*.mdl)')
			return (modelName==nil or hidden[modelName]~=true)
		end

        if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]
			if params["sggmrss90fake"] == 0 then
				addFileFilter("model/vehicle", modelFilter)
			end
		else
			addFileFilter("model/vehicle", modelFilter)
		end

		addModifier( "loadModel", metadataHandler )
	end
	}
end
