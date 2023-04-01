<script setup>
    import { ref, watch, toRef } from 'vue';
    import data from "../data/data.json";

    const emit = defineEmits(['getProjectName']);

    const searchProjectIndex = ref(0);
    const selectedProjectName = ref(data[0].project_name);


    const getSelectedProjectName = (projectName) => {
        emit('getProjectName', projectName);
        searchProjectIndex.value = data.findIndex((data) => data.project_name === projectName);
        selectedProjectName.value = data[searchProjectIndex.value].project_name;
    };


</script>

<template>
    <select name="Select Project" id="select-project" v-model="selectedProjectName" @change="getSelectedProjectName(selectedProjectName)">
        <option disabled value="">Select Project</option>
        <option v-for="project in data" :key="project.id" :value="project.project_name">
            {{ project.project_name }}
        </option>
    </select>
</template>


<style>
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