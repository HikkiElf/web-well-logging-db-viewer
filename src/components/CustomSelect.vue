<script setup>
    import { ref, watch, toRef } from 'vue';
    import data from "../data/data.json";

    const props = defineProps(['selectorType' , 'selectedProject']);

    const emit = defineEmits(['getAreaName', 'getProjectName'])

    const projects = data;

    const searchProjectIndex = ref(0);

    const selectedProjectValue = ref(data[0].project_name);

    const selectedAreaValue = ref(data[0].areas[0].area_name);

    const areasInProject = ref(data[0].areas);

    const testObject = ref({ 
        id: 1, 
        areas: [{
                id: 1,
                area_name: 'test1'
            }],
        id: 2,
        areas: [
            {
                id: 2,
                area_name: 'test2'
            }
        ]
        
    })

    
    
    const getSelectedAreaName = (areaName) => {
        emit('getAreaName', areaName);
    };
    const getSelectedProjectName = (projectName) => {
        emit('getProjectName', projectName);
        
        // console.log(areasInProject.value, "WHY ARE YOU BULLIN ME")
    };

    watch(toRef(props, 'selectedProject'), async (newName, oldName) => {
        console.log(newName + " CURRENT POJECT");
        searchProjectIndex.value = data.findIndex((project) => project.project_name === newName);
        console.log(projects[searchProjectIndex.value].areas);
        areasInProject.value = data[searchProjectIndex.value].areas;
        selectedAreaValue.value = areasInProject.value[0].area_name;
        // areasInProject.value = projects[].areas
        // searchIndex.value = allArea.findIndex((area) => area.area_name === props.areaName);
        // if (searchIndex.value == -1) searchIndex.value = 0;
    })

    // const getProjectAreasNames = (tree) => {
    //     const stack = Array (...tree);
    //     const result = [];
    //     while (stack.length > 0) {
    //         const node = stack.pop();
    //         if(node.area_name !== undefined) {
    //             result.push(node.area_name)
    //         }
    //         if(node.areas?.length) {
    //             stack.push(...node.areas)
    //         }
    //     }
    //     return result;

    // }

    // console.log(getProjectAreasNames(data));

    

    // onBeforeMount(() => {
    //    getSelectedAreaName(selectedAreaValue);
    //    getSelectedProjectName(selectedProjectValue);
    // });

</script>

<template>
    <select v-if="props.selectorType == 'Select Area'" name="Select Area" id="select-area" :selectedProject="props.selectedProject" v-model="selectedAreaValue" @change="getSelectedAreaName(selectedAreaValue)">
        <option disabled value="">Select Area</option>
        <option v-for="area in areasInProject" :key="area.id" :value="area.area_name"  >
            {{ area.area_name }}
        </option>
    </select>
    <select v-else-if="props.selectorType == 'Select Project'" name="Select Project" id="select-project" v-model="selectedProjectValue" @change="getSelectedProjectName(selectedProjectValue)">
        <option disabled value="">Select Project</option>
        <option v-for="project in projects" :key="project.id" :value="project.project_name">
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