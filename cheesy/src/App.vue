<template>
  <Procedure recipeName="Lactic Cheese" :recipe="lactic"/>
</template>

<script setup>
import lactic from './assets/lactic.json'
import Procedure from './components/Procedure.vue'
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
}
</style>
