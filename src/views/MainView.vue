<script setup>
    // import functions
    import { ref, watch} from 'vue';

    // import components
    import CustomTable from '../components/CustomTable.vue';
    import CustomSelectArea from '../components/CustomSelectArea.vue';
    import CustomSelect from '../components/CustomSelect.vue';

    // import data
    import d from "../data/data.json";

    const projectData = ref(d);
    const selectedPicketId = ref(0);
    const handlePicketId = (id) => {
        selectedPicketId.value = id;
    };
    const showSelectArea = ref(false);
    const selectedAreaName = ref("Gimalay"); // HARDCODE
    const selectedProjectName = ref("Select Project");
    const handleAreaName = (areaName) => {
        selectedAreaName.value = areaName;
    }
    const handleProjectName = (projectName) => {
        selectedProjectName.value = projectName;
    };
</script>

<template>
    <header>
        <h1>Select project: </h1>
        <CustomSelect :selectorType="'Select Project'" @getProjectName="handleProjectName"></CustomSelect>
        <h1>Select area:</h1>
        <CustomSelect :selectorType="'Select Area'" @getAreaName="handleAreaName"></CustomSelect>
        <!-- <h1>"{{ selectedProjectName }}" - "{{ selectedAreaName }}"</h1> -->
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
            <h1>Picket Data</h1>
            <h2>Picket id: {{ projectData[0].areas[0].pickets[selectedPicketId].id }}</h2>
            <h2>Electric Resistance: {{ projectData[0].areas[0].pickets[selectedPicketId].electric_resistance }}</h2>
            <h2>Layer density: {{ projectData[0].areas[0].pickets[selectedPicketId].layer_density }}</h2>
            <h2>Gamma ray: {{ projectData[0].areas[0].pickets[selectedPicketId].gamma_ray }}</h2>
            <h2>Magnetic field: {{ projectData[0].areas[0].pickets[selectedPicketId].magnetic_field }}</h2>
        </div>
        <div class="table-container">
            <CustomTable :area-name="selectedAreaName" @getPicketId = "handlePicketId" />
        </div>
    </main>
    <div>
        <Teleport to="body">
                <CustomSelectArea :show="showSelectArea" @close="showSelectArea = false">
                    <template #header>
                        <h3>Select Area</h3>
                    </template>
                    <template #body>
                        <h3>Custom body</h3>
                    </template>
                </CustomSelectArea>
            </Teleport>
    </div>
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