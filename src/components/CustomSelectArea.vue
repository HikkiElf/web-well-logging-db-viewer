<script setup>
  import { ref, watch, toRef } from 'vue';

  import data from "../data/data.json";

  const props = defineProps(['selectedProjectIndex']); // take in

  const emit = defineEmits(['getAreaName']); // give out 

  const selectedAreaName = ref(data[0].areas[0].area_name); // default zero index

  const areasInProject = ref(data[0].areas);

  const getSelectedAreaName = (areaName) => {
        emit('getAreaName', areaName);
    };

  watch(props.selectedProjectIndex, async (newIndex) => {
    areasInProject.value = data[newIndex].areas;
  });

</script>

<template>
  <select name="Select Area" id="select-area" :selectedProjectIndex="props.selectedProjectIndex" v-model="selectedAreaName" @change="getSelectedAreaName(selectedAreaName)">
        <option disabled value="">Select Area</option>
        <option v-for="area in areasInProject" :key="area.id" :value="area.area_name"  >
            {{ area.area_name }}
        </option>
    </select>
</template>

<style scoped>
select {
        --select-bg-color: var(--body-bg-color);

        cursor: pointer;
        appearance: none;
        opacity: 0.6;
        transition: opacity 0.2s;
        /* background-color: var(--select-bg-color); */
    }

    select:hover {
        opacity: 1;
        transition: opacity 0.2s;
    }


    select:required:invalid {
        color: gray;
    }
    option {
        background-color: var(--select-bg-color);
    }
</style>