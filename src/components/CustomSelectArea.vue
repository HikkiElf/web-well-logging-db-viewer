<script setup>
    import { ref, watch, toRef, onMounted } from 'vue';
    import axios, { isCancel, AxiosError} from 'axios';

    import data from "../data/data.json";

    const props = defineProps(['selectedProjectIndex']); // take in

    const emit = defineEmits(['getAreaName']); // give out 

    const responceGetAreaName = ref('');

    let areasInProject = [];
    toRef(areasInProject);

    const getSelectedAreaName = (areaName) => {
        emit('getAreaName', areaName);
    };

    const responseGetAreas = ref();
    const responseGetAreaName = ref("");


    onMounted(async () => {
        try {
            responseGetAreas.value = await axios.get(`https://well-logging.mrsmori.moe/areas?project_id=${props.selectedProjectIndex+1}`);
            
        } catch (error) {
            console.log(error);       
        }
        areasInProject = JSON.stringify(responseGetAreas.value.data);
        areasInProject = JSON.parse(areasInProject);
        responseGetAreaName.value = areasInProject[0].name;
        console.log(responseGetAreaName.value)
        toRef(areasInProject)
        console.log(areasInProject);
    })

    watch(toRef(props, 'selectedProjectIndex'), async (newIndex) => {
        responseGetAreas.value = await axios.get(`https://well-logging.mrsmori.moe/areas?project_id=${props.selectedProjectIndex+1}`);
        areasInProject = JSON.stringify(responseGetAreas.value.data);
        areasInProject = JSON.parse(areasInProject);
        console.log(areasInProject);
        console.log(responseGetAreaName.value)
    });

</script>

<template>
  <select name="Select Area" id="select-area" :selectedProjectIndex="props.selectedProjectIndex" v-model="responseGetAreaName" @change="getSelectedAreaName(responseGetAreaName)">
        <option disabled value="">Select Area</option>
        <option v-for="area in areasInProject" :key="area.id" :value="area.name"  >
            {{ area.name }}
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