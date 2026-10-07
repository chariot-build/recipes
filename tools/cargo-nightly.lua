local VERSION <const>  = "2026-10-01"
local CHECKSUM <const> = "1b8310588e1ea94970d5d83af01b44bb88c7bf3df9038c6027f8d989b8a9e2f3"

local target           = string.format("%s-unknown-linux-gnu", chariot.target_arch)
local url              = string.format("https://static.rust-lang.org/dist/%s/rust-nightly-%s.tar.xz", VERSION, target)
local components       = { "cargo", "rustc", string.format("rust-std-%s", target) }

return Tool {
    name = "cargo",
    version = string.gsub(VERSION, "-", "."),
    revision = 1,
    source = Source { "cargo", Archive(url, CHECKSUM) },
    env = { COMPONENTS = table.concat(components, ",") },
    install = [[
        $SOURCE_DIR/install.sh --prefix=$PREFIX --destdir=$INSTALL_DIR --components=$COMPONENTS
    ]]
}
