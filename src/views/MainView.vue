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
    const selectedAreaName = ref("Select Area");
    const selectedProjectName = ref("Select Project");
    const handleAreaName = (areaName) => {
        selectedAreaName.value = areaName;
    }
    const handleProjectName = (projectName) => {
        selectedProjectName.value = projectName;
    }
</script>

<template>
    <header>
        <h1>"{{ selectedProjectName }}" - "{{ selectedAreaName }}"</h1>
    </header>
    <main>
        <div class="buttons-container">
            <div class="left-buttons">
                <CustomSelect :selectorType="'Select Area'" @getAreaName="handleAreaName"></CustomSelect>
                <CustomButton>Edit area</CustomButton>
                <CustomButton>Add picket</CustomButton>
                <CustomButton>Edit data</CustomButton>
                <CustomButton>Edit project</CustomButton>
            </div>

            <div class="right-buttons">
                <CustomButton>Add area</CustomButton>
                <CustomButton>Delete area</CustomButton>
                <CustomButton>Delete picket</CustomButton>
                <CustomSelect :selectorType="'Select Project'" @getProjectName="handleProjectName"></CustomSelect>
                <CustomButton>Delete project</CustomButton>
            </div>

        </div>
        <div class="picket-info-container">
            <h1>Picket Data</h1>
            <h2>Picket id: {{ projectData[0].areas[0].pickets[selectedPicketId].id }}</h2>
            <h2>Electric Resistance: {{ projectData[0].areas[0].pickets[selectedPicketId].Measurements.electricResistance }}</h2>
            <h2>Layer density: {{ projectData[0].areas[0].pickets[selectedPicketId].Measurements.layerDensity }}</h2>
            <h2>Gamma ray: {{ projectData[0].areas[0].pickets[selectedPicketId].Measurements.gammaRay }}</h2>
            <h2>Magnetic field: {{ projectData[0].areas[0].pickets[selectedPicketId].Measurements.magneticField }}</h2>
        </div>
        <div class="table-container">
            <CustomTable :data="projectData" @changePicketId = "handlePicketId" />
        </div>
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
    </main>
</template>

<style scoped>
    header {
        text-align: center;
        font-size: 60px;
        margin-bottom: 100px;
    }
    main {
        display: flex;
        justify-content: space-around;
    }
    .buttons-container {
        display: flex;
        width: 280px;
    }
    .right-buttons {
        margin-left: 20px;
    }
    .buttons-container button {
        width: 92%;
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
        height: 250px;
    }

    
</style>