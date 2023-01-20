import React, { useContext } from "react"
import { Context } from "../context/Context"

const Home = () => {
	const { curentUser } = useContext(Context)
	return <div>Home</div>
}

export default Home
