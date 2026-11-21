import { Plugin } from "@opencode/plugin"

export default Plugin.define({
  id: "env-protection",
  async setup(ctx) {
    await ctx.tool.hook("execute.before", (event) => {
      if (event.tool !== "read") return
      const input = event.input as { filePath?: string; path?: string }
      const file = input.filePath ?? input.path
      if (file?.includes(".env")) throw new Error("Do not read .env files")
    })
  },
})
