<script setup>
    import { ref, watch, toRef, onMounted } from 'vue';
    import axios, { isCancel, AxiosError} from 'axios';

    const props = defineProps(['selectedProjectId']); // take in

    const emit = defineEmits(['getAreaId']); // give out 

    const selectedAreaName = ref("");

    const selectedAreaId = ref(1);

    const refAreasInProject = ref([]);

    const getSelectedAreaId = (areaName) => {
        selectedAreaId.value = refAreasInProject.value.find((area) => area.name == areaName).id;
        emit('getAreaId', selectedAreaId.value);
    };

    const responseGetAreas = ref();
    const responseGetAreaId = ref(1);

    watch(toRef(props, 'selectedProjectId'), async (newIndex) => {
        responseGetAreas.value = await axios.get(`https://well-logging.mrsmori.moe/areas?project_id=${props.selectedProjectId}`);
        refAreasInProject.value = JSON.stringify(responseGetAreas.value.data);
        refAreasInProject.value = JSON.parse(refAreasInProject.value);
    });

</script>

<template>
  <select name="Select Area" id="select-area" :selectedProjectId="props.selectedProjectId" v-model="selectedAreaName" @change="getSelectedAreaId(selectedAreaName)">
        <option disabled value="">Select Area</option>
        <option v-for="area in refAreasInProject" :key="area.id" :value="area.name"  >
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
        border: 1px dotted white;
        padding: 5px;
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