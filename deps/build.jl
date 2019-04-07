version = "3.16.08"
os_string = @static is_apple() ? "darwin" : "linux"
extension = @static is_apple() ? "darwin" : "tar.gz"

file_name = "dReal-$version-$os_string-shared-libs.$extension"
file_url = "https://github.com/dreal/dreal3/releases/download/v$version/$file_name"
deps_dir = dirname(@__FILE__)
prefix = joinpath(deps_dir,"usr")

println("Cleanup old build files")

try
  run(`rm  -r $(joinpath(deps_dir,"dReal*"))`)
catch end
try
  run(`rm -r $(joinpath(deps_dir,"usr"))`)
catch end

download(file_url,joinpath(deps_dir,file_name))
@static is_apple() ? begin
  run(`unzip $file_name`)
end : begin
  run(`tar -xvf $file_name`)
end
run(`mv $(joinpath(deps_dir, "dReal-$version-$os_string-shared-libs")) usr`)
