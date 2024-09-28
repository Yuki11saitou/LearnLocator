module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  plugins: [
    require("daisyui")
  ],

  daisyui: {
    // 使用テーマの設定
    themes: ["cmyk"],
    // ダークモードの無効化
    darkTheme: false,
  }
}