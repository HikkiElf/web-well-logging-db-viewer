<script setup>
// import functions
import { ref } from "vue";
import axios from "axios";
import Plotly from "plotly.js-dist";

// import components
import CustomTable from "../components/CustomTable.vue";
import CustomSelectArea from "../components/CustomSelectArea.vue";
import CustomSelectProject from "../components/CustomSelectProject.vue";
import { RouterLink } from "vue-router";

const graphContainer = ref(null);

const selectedProjectId = ref(0);

const selecteAreaId = ref(0);

const selectedPicketId = ref(0);

const allPicketsInArea = ref();

const selectedPicketData = ref();

const userStatus = ref();

const handlePicketId = (id) => {
  selectedPicketId.value = id;
  selectedPicketData.value = allPicketsInArea.value.find(
    (picket) => picket.id == id
  );
};

const handleAreaId = async (areaId) => {
  selecteAreaId.value = areaId;
  allPicketsInArea.value = (
    await axios.get(
      `https://well-logging.mrsmori.moe/pickets?area_id=${areaId}`
    )
  ).data;
  selectedPicketData.value = null;
  selectedPicketId.value = 0;
};

const handleProjectId = (projectId) => {
  selectedProjectId.value = projectId;
  selectedPicketData.value = null;
  selectedPicketId.value = 0;
};

const handelUserStatus = (status) => {
  userStatus.value = status;
};

let layout = {
  paper_bgcolor: "rgba(0,0,0,0)",
  title: "",
  autosize: false,
  width: 500,
  height: 500,
};

function CreateGraph(measurementsType) {
  let z = [];
  for (let i = 0; i < 5; i++) {
    z.push([]);
  }

  for (let i = 0; i < 5; i++) {
    for (let j = 0; j < 5; j++) {
      z[i].push(
        allPicketsInArea.value.find(
          (data) =>
            data?.X_picket_coord == j + 1 && data?.Y_picket_coord == i + 1
        )[measurementsType]
      );
    }
  }
  const data_z = [
    {
      z: z,
      type: "surface",
      x: [1, 2, 3, 4, 5],
      y: [1, 2, 3, 4, 5],
    },
  ];
  layout.title = measurementsType;
  Plotly.newPlot(graphContainer.value, data_z, layout);
}
</script>

<template>
  <header>
    <h1>Select project:</h1>
    <CustomSelectProject @get-project-id="handleProjectId" @get-user-status="handelUserStatus"></CustomSelectProject>
    <h1>Select area:</h1>
    <CustomSelectArea @get-area-id="handleAreaId" :selected-project-id="selectedProjectId"></CustomSelectArea>
  </header>
  <main>
    <div class="buttons-container">
      <div class="employee-buttons" v-if="userStatus != 'Client'">
        <button>Add picket</button>
        <button>Add area</button>
        <button>Edit area</button>
        <button>Edit data</button>
        <button>Edit project</button>
        <div class="moderator-buttons" v-if="userStatus == 'Moderator'">
          <button>Delete area</button>
          <button>Delete picket</button>
          <button>Delete project</button>
        </div>
      </div>
    </div>
    <div class="picket-info-container">
      <h1>Picket Data</h1>
      <h2>Picket id: {{ selectedPicketId }}</h2>
      <h2>
        Electric Resistance: {{ selectedPicketData?.electric_resistance }}
      </h2>
      <h2>Layer density: {{ selectedPicketData?.layer_density }}</h2>
      <h2>Gamma ray: {{ selectedPicketData?.gamma_ray }}</h2>
      <h2>Magnetic field: {{ selectedPicketData?.magnetic_field }}</h2>
      <h2>
        Creation Date: {{ selectedPicketData?.creation_date.slice(0, 16) }}
      </h2>
    </div>
    <div class="table-container">
      <CustomTable :selected-area-id="selecteAreaId" @getPicketId="handlePicketId" />
    </div>
    <RouterLink to="/login">
      <button>Exit</button>
    </RouterLink>
  </main>
  <button @click="CreateGraph('electric_resistance')">
    Electric Resistance Graph
  </button>
  <button @click="CreateGraph('layer_density')">Layer Density Graph</button>
  <button @click="CreateGraph('gamma_ray')">Gamma Ray Graph</button>
  <button @click="CreateGraph('magnetic_field')">Magnetic Field Graph</button>
  <div ref="graphContainer"></div>
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
  width: 150px;
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
  display: flex;
  flex-direction: column;
  align-items: end;
  overflow-y: auto;
  overflow-x: hidden;
  /* border: 2px solid white; */
  height: 59%;
  padding-left: 10px;
}

button {
  padding: 10px 15px;
  margin: 5px;
  appearance: none;
  color: white;
  background: var(--btn-bg-color);
  border-radius: 8px;
  text-align: center;
  text-decoration: none;
  font-size: 14px;
  transition: transform 0.05s ease-in-out;
}

@media (min-width: 500px) {
  button:hover {
    transform: scale(1.1);
  }
}

button:active {
  background: var(--btn-bg-color);
  transform: scale(0.9);
}
</style>
