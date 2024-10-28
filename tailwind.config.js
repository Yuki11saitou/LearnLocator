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
        'body-jp': ['Noto Sans JP', 'serif'],
        'body-en': ['Noto Sans', 'serif']
      },
      // // 画像、テキストのアニメーション追加
      // animation: {
      //   "fade-in-fwd": "fade-in-fwd 1.9s cubic-bezier(0.390, 0.575, 0.565, 1.000)   both"
      // },
      // keyframes: {
      //   "fade-in-fwd": {
      //     "0%": {
      //         transform: "translateZ(-80px)",
      //         opacity: "0"
      //     },
      //     to: {
      //         transform: "translateZ(0)",
      //         opacity: "1"
      //     }
      //   }
      // }
    }
  }
}