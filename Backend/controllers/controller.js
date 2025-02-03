const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

const getAllErtekeles = async (req, res) => {
    try{
        const ertekelesek = await prisma.ertekelesek.findMany({
            include: {
                 
            },
        }
        );
        res.status(200).json(ertekelesek);
    } catch (error){
        res.status(500).json({error: "Hiba történt a lekérdezéskor!"});
    }
};

// req => request(kérés)
// res => response(válasz)
const createErtekeles = async (req, res) => {
    const { ar, leiras, kepUrl, kategoria } = req.body;
    if ( !business_id || !rating || !comment){
        return res.status(400).json({error: "Hiányos adatok"});
    }
    try{
        const newErtekeles = await prisma.ertekelesek.create({
            data: {
                business_id: parseInt(business_id),
                rating,
                comment,
            },
        });
        res.status(201).json(newErtekeles);
    }
    catch(error){
        res.status(500).json({
            error: "Hiba az értékelés adatainak rögzítésekor"
        });
    }
}

const deleteErtekeles = async (req, res) => {
    const { id } = req.params;
    try{
        const deletedErtekeles = await prisma.ertekelesek.delete({
            where: {
                id: parseInt(id)
            }
        });
        res.status(204);
    }
    catch(error){
        res.status(404).json({ error: "Értékelés nem létezik"});
    }
}
module.exports = {
    getAllErtekeles, 
    createErtekeles,
    deleteErtekeles
};
