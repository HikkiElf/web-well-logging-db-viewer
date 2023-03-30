<script setup>
    import { ref } from 'vue';
    import d from "../data/data.json";

    import { onMounted } from 'vue';

    const props = defineProps(['selectorType']);

    const emit = defineEmits(['getAreaName', 'getProjectName'])

    const selectedValue = ref("")


    const getSelectedAreaName = (areaName) => {
        emit('getAreaName', areaName);
    };
    const getSelectedProjectName = (projectName) => {
        emit('getProjectName', projectName);
    };
    const areasInProject = d[0].areas;
    const projects = d;


    onMounted(() => {
        // console.log(areasInProject)
        // console.log(selectorType)
    });

</script>

<template>
    <select v-if="selectorType == 'Select Area'" name="Select Area" id="select-area" v-model="selectedValue" @change="getSelectedAreaName(selectedValue)">
        <option disabled value="">Select Area</option>
        <option :value="area.areaName" v-for="area in areasInProject" :key="area.id">
            {{ area.areaName }}
        </option>
    </select>
    <select v-else-if="selectorType == 'Select Project'" name="Select Project" id="select-project" v-model="selectedValue" @change="getSelectedProjectName(selectedValue)">
        <option disabled value="">Select Project</option>
        <option :value="project.projectName" v-for="project in projects" :key="project.id">
            {{ project.projectName }}
        </option>
    </select>

</template>

<style scoped>
    select {
        --select-bg-color: var(--body-bg-color);

        cursor: pointer;
        /* background-color: var(--select-bg-color); */
    }

    select:required:invalid {
        color: gray;
    }
    option {
        background-color: var(--select-bg-color);
    }

    

</style>