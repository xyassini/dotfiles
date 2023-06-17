local status, package_info = pcall(require, "package-info")
if not status then
  return
end

package_info.setup({
  colors = {
    up_to_date = "#1ebf15",
    outdated = "#ed2424",
  },
  package_manager = "npm",
})
