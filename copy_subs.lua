utils = require 'mp.utils'

local function copy_subs()
  -- mp.set_property_bool('pause', true)
  print(mp.get_property("sub-text"))
  local res = utils.subprocess({ args = {
    'powershell', '-NoProfile', '-Command', string.format([[& {
      Trap {
        Write-Error -ErrorRecord $_
        Exit 1
      }
      Add-Type -AssemblyName PresentationCore
      [System.Windows.Clipboard]::SetText(@"
%s
"@)
    }]], mp.get_property("sub-text"))
  } })
end

mp.add_forced_key_binding("c", "copy_subs", copy_subs)
