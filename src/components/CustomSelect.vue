<script setup>
    import { onBeforeMount, ref } from 'vue';
    import data from "../data/data.json";

    import { onMounted } from 'vue';

    const props = defineProps(['selectorType']);

    const emit = defineEmits(['getAreaName', 'getProjectName'])

    const projects = data;

    const selectedProjectValue = ref(data[0].project_name);

    const selectedAreaValue = ref(data[0].areas[0].area_name);

    const areasInProject = data[0].areas;


    const getSelectedAreaName = (areaName) => {
        emit('getAreaName', areaName);
    };
    const getSelectedProjectName = (projectName) => {
        emit('getProjectName', projectName);
    };


    // onBeforeMount(() => {
    //    getSelectedAreaName(selectedAreaValue);
    //    getSelectedProjectName(selectedProjectValue);
    // });

</script>

<template>
    <select v-if="props.selectorType == 'Select Area'" name="Select Area" id="select-area" v-model="selectedAreaValue" @change="getSelectedAreaName(selectedAreaValue)" @load="getSelectedAreaName(selectedAreaValue)">
        <option disabled value="">Select Area</option>
        <option :value="area.area_name" v-for="area in areasInProject" :key="area.id">
            {{ area.area_name }}
        </option>
    </select>
    <select v-else-if="props.selectorType == 'Select Project'" name="Select Project" id="select-project" v-model="selectedProjectValue" @change="getSelectedProjectName(selectedProjectValue)" @load="getSelectedProjectName(selectedProjectValue)">
        <option disabled value="">Select Project</option>
        <option :value="project.project_name" v-for="project in projects" :key="project.id">
            {{ project.project_name }}
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