<template>
  <div class="recipeContainer">
    <h2>{{ $props.recipe.name }}</h2>
    <table id="recipeTable">
      <thead>
        <tr><th class="material">Ingredient</th><th colspan=2>Quantity</th><th>Time</th><th>Temp</th><th class="procedure">Procedure</th></tr>
      </thead>
      <tbody v-for="step in $props.recipe.steps">
        <tr v-for="(ing, idx) in step.ingredients">
          <td>{{ing.material}}</td>
          <td class="numeric nowrap">{{renderAmount(ing.quantity)}}</td>
          <td class="nowrap">{{ing.unit}}</td>
          <td class="nowrap">{{(idx == 0 ? step.time : '')}}</td>
          <td class="nowrap">{{(idx == 0 ? step.temp : '')}}</td>
          <td :rowspan="(idx == 0 ? step.ingredients.length : null)">{{(idx == 0 ? step.procedure : '')}}</td>
        </tr>
        <tr class="hrule"><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      </tbody>
    </table>
  </div>
</template>

<script setup>
import { defineProps, reactive } from 'vue'
defineProps({
  recipeName: String,
  recipe: Object
})

const fractions = {
  "0.25": "\u00bc",
  "0.5": "\u00bd",
  "0.75": "\u00be",
  "0.125": "\u215b"
}

const renderAmount = function(amt) {
  var x = fractions[amt]
  if (x != null) {
    return x
  }
  return amt
}
</script>

<style scoped>
div.recipeContainer {
  width: 8in;
  margin-left: auto;
  margin-right: auto;
  font.size: 8pt;
}
table {
  margin-left: auto;
  margin-right: auto;
  border-collapse: collapse;
}
th {
  text-align: left;
  padding-left: 1em;
  padding-bottom: 1em;
  border-bottom: 2pt solid black;
}
th.material {
  width: 25%;
}
th.procedure {
  width: 50%;
}
tr {
  vertical-align: top;
}
td {
  font-size: 9pt;
  text-align:left;
  vertical-align: top;
  padding-left: 1em;
  padding-top: 0.25em;
  padding-bottom: 0.25em;
}
td.nowrap {
  white-space: nowrap;
}
td.numeric {
  text-align: right;
}
tr.hrule {
  padding-top: 1em;
  padding-bottom: 1em;
  border-bottom: 1pt solid black;
}
</style>
