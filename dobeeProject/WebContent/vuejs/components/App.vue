
export default {
  computed: {
    username () {
      // 곧 `params` 확인할 수 있습니다.
      return this.$route.params.username
    }
  },
  methods: {
    goBack () {
      window.history.length > 1
        ? this.$router.go(-1)
        : this.$router.push('/')
    }
  }
}