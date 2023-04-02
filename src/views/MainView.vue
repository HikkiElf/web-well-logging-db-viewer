<script setup>
    // import functions
    import { ref, onUpdated} from 'vue';
    import axios from 'axios';

    // import components
    import CustomTable from '../components/CustomTable.vue';
    import CustomSelectArea from '../components/CustomSelectArea.vue';
    import CustomSelectProject from '../components/CustomSelectProject.vue';
    import { RouterLink } from 'vue-router';
    
    const selectedProjectId = ref(0);

    const selecteAreaId = ref(0);

    const selectedPicketId = ref(0);

    const allPicketsInArea = ref();

    const selectedPicketData = ref();

    const userStatus = ref();
    
    const handlePicketId = (id) => {
        selectedPicketId.value = id;
        selectedPicketData.value = allPicketsInArea.value.find((picket) => picket.id == id);
    };
    
    const handleAreaId = async (areaId) => {
        selecteAreaId.value = areaId;
        allPicketsInArea.value = (await axios.get(`https://well-logging.mrsmori.moe/pickets?area_id=${areaId}`)).data;
        selectedPicketData.value = null;
        selectedPicketId.value = 0;
    };

    const handleProjectId = (projectId) => {
        selectedProjectId.value = projectId;
        selectedPicketData.value = null;
        selectedPicketId.value = 0;
    };

    const handelUserStatus = (status) => {
        userStatus.value = status
        console.log(userStatus.value, "YEAAAAAHA");
    };

</script>

<template>
    <header>
        <h1>Select project: </h1>
        <CustomSelectProject @get-project-id="handleProjectId" @get-user-status="handelUserStatus"></CustomSelectProject>
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
            <h1>Picket Data</h1>
            <h2>Picket id: {{ selectedPicketId }}</h2>
            <h2>Electric Resistance: {{ selectedPicketData?.electric_resistance }}</h2>
            <h2>Layer density: {{ selectedPicketData?.layer_density }}</h2>
            <h2>Gamma ray: {{ selectedPicketData?.gamma_ray }}</h2>
            <h2>Magnetic field: {{ selectedPicketData?.magnetic_field }}</h2>
        </div>
        <div class="table-container">
            <CustomTable :selected-area-id="selecteAreaId" @getPicketId = "handlePicketId" />
        </div>
        <RouterLink to="/login">
            <button>Exit</button>
        </RouterLink>
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
        /* border: 2px solid red; */
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

    button {
        padding: 10px 15px;
        margin: 5px;
        appearance: none;
        background: var(--btn-bg-color);
        border-radius: 8px;
        text-align: center;
        text-decoration: none;
        font-size: 14px;
        transition: transform .05s ease-in-out;
    }

    @media (min-width: 500px) {
        button:hover {
            transform: scale(1.1);
        }
    }

    button:active{
        background: var(--btn-bg-color);
        transform: scale(0.9);
    }

    
</style>