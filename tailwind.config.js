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
    darkTheme: false
  },

  theme: {
    extend: {
      fontFamily: {
        // 'body-en': ['Noto Sans', 'serif'],
        'body-jp': ['Noto Sans JP', 'serif']
      },
      // 画像、テキストのアニメーション追加
      animation: {
        "tracking-in-contract": "tracking-in-contract 2.0s cubic-bezier(0.215, 0.610, 0.355, 1.000)   both"
      },
      keyframes: {
        "tracking-in-contract": {
          "0%": {
              "letter-spacing": "1em",
              opacity: "0"
          },
          "40%": {
              opacity: ".6"
          },
          to: {
              "letter-spacing": "normal",
              opacity: "1"
          }
        }
      }
    }
  }
}