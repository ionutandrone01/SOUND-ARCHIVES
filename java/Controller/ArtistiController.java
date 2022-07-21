package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pojo.GenuriMuzicale;
import pojo.Albume;
import pojo.Artisti;
import DAOImpl.ArtistiDaoImpl;
import DAOImpl.HibernateUtil;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.hibernate.Session;


public class ArtistiController extends HttpServlet {

	Artisti artist = new Artisti();
	ArtistiDaoImpl artistDaoImpl = new ArtistiDaoImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("adaugaArtist") != null) {
			// preluarea parametrilor de interes
			long idgen = java.lang.Long.parseLong(request.getParameter("idgen"));
			long idalbum = java.lang.Long.parseLong(request.getParameter("idalbum"));
			Session session = HibernateUtil.getSessionFactory().openSession();
			GenuriMuzicale genmuzical = (GenuriMuzicale) session.get(GenuriMuzicale.class, idgen);
			Albume album = (Albume) session.get(Albume.class, idalbum);

			String nume = request.getParameter("nume");
			String prenume = request.getParameter("prenume");
			String data_lansare = request.getParameter("data_lansare");
			String trupa = request.getParameter("trupa");
      
			artist.setGenurimuzicale(genmuzical);
			artist.setAlbume(album);		
			artist.setNume(nume);
			artist.setPrenume(prenume);
			artist.setData_lansare(data_lansare);
			artist.setTrupa(trupa);
			if(nume != "" && prenume!= "" && data_lansare!= "" && trupa!="") {
				artistDaoImpl.adaugaArtist(artist);
				List<Artisti> listaArtisti = new ArrayList();
				listaArtisti = artistDaoImpl.afiseazaArtist();
				request.setAttribute("listaArtisti", listaArtisti);
				RequestDispatcher rd = request.getRequestDispatcher("tabela_Artisti.jsp");
				rd.forward(request, response);
			}
			else {
			RequestDispatcher rd = request.getRequestDispatcher("adauga_Artist.jsp");
			rd.forward(request, response);
		}
	}
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("afiseazaArtist") != null) {
			List<Artisti> listaArtisti = new ArrayList();
			listaArtisti = artistDaoImpl.afiseazaArtist();
			request.setAttribute("listaArtisti", listaArtisti);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Artisti.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("modificaArtist") != null) {
			Long id1 = Long.parseLong(request.getParameter("idartist"));
			// preluarea parametrilor de interes
			Long idgen = java.lang.Long.parseLong(request.getParameter("idgen"));
			Long idalbum = java.lang.Long.parseLong(request.getParameter("idalbum"));
			Session session = HibernateUtil.getSessionFactory().openSession();
			GenuriMuzicale genmuzical = (GenuriMuzicale) session.get(GenuriMuzicale.class, idgen);
			Albume album = (Albume) session.get(Albume.class, idalbum);

		
			String nume = request.getParameter("nume");
			String prenume = request.getParameter("prenume");
			String data_lansare = request.getParameter("data_lansare");
			String trupa = request.getParameter("trupa");
			if(nume != "" && prenume!= "" && data_lansare!= "" && trupa!="") {
				artistDaoImpl.modificaArtist(id1, album, genmuzical, nume, prenume, data_lansare, trupa);
				List<Artisti> listaArtisti = new ArrayList();
				listaArtisti = artistDaoImpl.afiseazaArtist();
				request.setAttribute("listaArtisti", listaArtisti);
				RequestDispatcher rd = request.getRequestDispatcher("tabela_Artisti.jsp");
				rd.forward(request, response);
			}
			else {
			RequestDispatcher rd = request.getRequestDispatcher("adauga_Artist.jsp");
			rd.forward(request, response);
			}
		}

		if (request.getParameter("stergeArtist") != null) {
			Long id2 = Long.parseLong(request.getParameter("idartist"));
			artist.setIdartist(id2);
			artistDaoImpl.stergeArtist(artist);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_Artist.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>
}