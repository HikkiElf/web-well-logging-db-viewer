<script setup>
    // import functions
    import { ref, watch, onMounted} from 'vue';
    import axios, { isCancel, AxiosError} from 'axios';

    import {getAreas, getProjects} from '../data/getProjects';

    // import components
    import CustomTable from '../components/CustomTable.vue';
    import CustomSelectArea from '../components/CustomSelectArea.vue';
    import CustomSelectProject from '../components/CustomSelectProject.vue';
    
    const searchAreaIndex = ref(0);
    
    const selectedProjectId = ref(0);

    const selectedPicketId = ref(0);
    
    const handlePicketId = (id) => {
        selectedPicketId.value = id;
    };
    
    const handleAreaId = (areaName) => {
        console.log(areaName);
        // allAreas.value = data[searchProjectIndex.value].areas;
        // searchAreaIndex.value = allAreas.value.findIndex((area) => area.area_name === areaName);
        selectedPicketId.value = 0;
        
    };

    const handleProjectId = (projectId) => {
        selectedProjectId.value = projectId;
        console.log(projectId);
        selectedPicketId.value = 0;
    };

</script>

<template>
    <header>
        <h1>Select project: </h1>
        <CustomSelectProject @get-project-id="handleProjectId"></CustomSelectProject>
        <h1>Select area:</h1>
        <CustomSelectArea @get-area-id="handleAreaId" :selected-project-id="selectedProjectId"></CustomSelectArea>
    </header>
    <main>
        <div class="buttons-container">

            <CustomButton>Add picket</CustomButton>
            <CustomButton>Add area</CustomButton>
            <CustomButton>Edit area</CustomButton>
            <CustomButton>Edit data</CustomButton>
            <CustomButton>Edit project</CustomButton>

            <CustomButton>Delete area</CustomButton>
            <CustomButton>Delete picket</CustomButton>
            <CustomButton>Delete project</CustomButton>


        </div>
        <div class="picket-info-container">
            <!-- <h1>Picket Data</h1>
            <h2>Picket id: {{ data[searchProjectIndex].areas[searchAreaIndex].pickets[selectedPicketId].id }}</h2>
            <h2>Electric Resistance: {{ data[searchProjectIndex].areas[searchAreaIndex].pickets[selectedPicketId].electric_resistance }}</h2>
            <h2>Layer density: {{ data[searchProjectIndex].areas[searchAreaIndex].pickets[selectedPicketId].layer_density }}</h2>
            <h2>Gamma ray: {{ data[searchProjectIndex].areas[searchAreaIndex].pickets[selectedPicketId].gamma_ray }}</h2>
            <h2>Magnetic field: {{ data[searchProjectIndex].areas[searchAreaIndex].pickets[selectedPicketId].magnetic_field }}</h2> -->
        </div>
        <div class="table-container">
            <!-- <CustomTable :area-search-index="searchAreaIndex" :project-search-index="searchProjectIndex" @getPicketId = "handlePicketId" /> -->
        </div>
    </main>
</template>

<style scoped>
    header {
        display: flex;
        justify-content: space-evenly;
        font-size: 60px;
        margin-bottom: 100px;
        /* border: 2px solid red; */
    }
    main {
        display: inline-flex;
        width: 100%;
        height: 50dvh;
        justify-content: space-around;
        border: 2px solid red;
    }
    .buttons-container {
        display: flex;
        flex-direction: column;
        justify-content: baseline;
        align-items: center;
        width: 280px;
    }
    .buttons-container button {
        width: 150px
    }

    .picket-info-container {
        font-size: 30px;
    }
    .picket-info-container h1 {
        font-weight: bold;
        margin-bottom: 20px;
        font-size: 35px;
    }

    .table-container {
        overflow-y: auto;
        overflow-x: hidden;
        border: 2px solid white;
        height: 59%;
    }

    
</style>