<template>

<div>
  <b-card title="Card Title" no-body>
    <b-card-header header-tag="nav">
      <b-nav card-header pills>
        <b-nav-item active>법인 카드 목록</b-nav-item>
        <b-nav-item>비용 확인</b-nav-item>
        <b-nav-item>비용정산 신청</b-nav-item>
      </b-nav>
    </b-card-header>

    <b-card-body class="text-center">
      <b-card-text>
          영수증 처리

          <div>
            왜 새로고침이 이렇게 힘든 일이였나??
          </div>












      </b-card-text>

       <div>
        <b-form-input v-model="text" placeholder="Enter your name"></b-form-input>
        <div class="mt-2">Value: {{ text }}</div>
      </div>


      <!-- <b-button variant="primary">Go somewhere</b-button> -->
    </b-card-body>
  </b-card>
</div>
  


</template>

<script>

import axios from 'axios'

 export default {
   name:"test1",
    data() {
      return {
        text: ''
      }
    }
  }



</script>


<style>

</style>